(setq ls-lisp-dirs-firest t
      custom-file (expand-file-name "~/.emacs.d/custom.el")
      slime-helper (expand-file-name "~/.quicklisp/slime-helper.el")
      inferior-lisp-program (expand-file-name "~/.local/bin/sbcl")
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; Load emacs settings
(load custom-file)

;; Startup server so emacsclient can connect
(server-start)

(setenv "PATH" (concat (expand-file-name "~/.local/bin") path-separator (getenv "PATH")))
(setenv "SBCL_HOME" (expand-file-name "~/.local/lib/sbcl"))

;; Add site-lisp and its subdirs to the load-path
(let ((default-directory (concat user-emacs-directory "site-lisp")))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; Requires
(require 'uniquify)
(require 'magit)
(require 'rinari)
(require 'ansi-color)
(require 'redo+)
(require 'icomplete)
(require 'icomplete+)
(require 'icicles)

;; WLOR
(require 'whole-line-or-region)
(whole-line-or-region-mode t)

;; CUA
(cua-mode t)
(transient-mark-mode 1)
(cua-selection-mode t)

;; Autopair
(require 'autopair)
(autopair-global-mode)

;; rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))

;; Slime
(when (load slime-helper)
  (require 'slime)
  (add-hook 'slime-mode-hook
	    (lambda ()
	      (unless (slime-connected-p)
		(save-excursion (slime)))))
  (slime-setup '(slime-fancy slime-sbcl-exts slime-sprof slime-xref-browser)))

;; Color-theme
(require 'color-theme)
(when (load-theme 'sunburst)
  (color-theme-sunburst))

;; ACK
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; Org Mode
(require 'org-install)

;; Auto Complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

;; Lori Mode
(defvar lori-minor-mode-map (make-keymap) "lori-minor-mode keymap.")
(define-minor-mode lori-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " lori" 'lori-minor-mode-map)

(add-hook 'minibuffer-setup-hook (lambda() (lori-minor-mode 0)))
(lori-minor-mode 1)

;; Customization
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode 1)
(msb-mode t)

(defun eshell/emacs (file)
  (find-file file))
(defun eshell/open (file)
  (find-file file))
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defalias 'open 'find-file)
(defalias 'sh 'eshell)

(defadvice kill-line (before check-position activate)
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1))))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Methods
(defun fake-stdin-slurp (filename)
  "Emulate stdin slurp using emacsclient hack"
  (switch-to-buffer (generate-new-buffer "*stdin*"))
  (insert-file filename)
  (end-of-buffer))

(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
        (exchange-point-and-mark))
     (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun comment-or-uncomment-line-or-region (prefix)
  "Similar to comment-or-uncomment-region but also acts on the whole line if no mark is active."
  (interactive "*p")
  (whole-line-or-region-call-with-region 'comment-or-uncomment-region prefix t))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(put 'smart-beginning-of-line 'CUA 'move)

(defun locate-file-under-dir() 
  "Locate a file under the specified directory"
  (setq current-prefix-arg (list 1))
  (interactive)
  (icicle-locate-file))

(defun rename-file-and-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (message "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file filename new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)))))))

;; Key bindings
(windmove-default-keybindings 'control) ;; meta+direction
(define-key global-map (kbd "C-<tab>") 'hippie-expand)
(define-key global-map (kbd "M-g s") 'magit-status)

(define-key global-map (kbd "C-s-<up>") 'move-text-up)
(define-key global-map (kbd "C-s-<down>") 'move-text-down)
(define-key global-map (kbd "C-c r") 'rename-file-and-buffer)
(define-key global-map (kbd "C-c s") 'eshell)
(define-key global-map (kbd "C-x C-b") 'ibuffer)

(define-key global-map (kbd "s-o") 'vi-open-line-below)
(define-key global-map (kbd "s-O") 'vi-open-line-above)
(define-key global-map (kbd "s-z") 'undo)
(define-key global-map (kbd "s-Z") 'redo)
(define-key global-map (kbd "s-b") 'icicle-buffer)
(define-key global-map (kbd "s-r") 'revert-buffer)
(define-key global-map (kbd "s-t") 'locate-file-under-dir)
(define-key global-map (kbd "s-e") 'icicle-bookmark-jump)
(define-key global-map (kbd "s-/") 'comment-or-uncomment-line-or-region)
(define-key global-map (kbd "s-y") 'icicle-completing-yank)
(define-key global-map (kbd "s-j") 'secondary-to-primary)

(define-key global-map (kbd "s-<left>") 'smart-beginning-of-line)
(define-key global-map (kbd "s-<right>") 'end-of-line)
(define-key global-map (kbd "<home>") 'smart-beginning-of-line)
(define-key global-map (kbd "<end>") 'end-of-line)

(define-key global-map (kbd "<S-down-mouse-1>") 'ignore)
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)
(put 'mouse-set-point 'CUA 'move)
(define-key global-map (kbd "<mouse-3>") (lookup-key global-map (kbd "C-<down-mouse-3>")))

;; search forward with Ctrl-f/g
(define-key global-map (kbd "s-f") 'isearch-forward-regexp)
(define-key isearch-mode-map (kbd "s-f") (lookup-key isearch-mode-map (kbd "C-s")))
(define-key minibuffer-local-isearch-map (kbd "s-f") (lookup-key minibuffer-local-isearch-map (kbd "C-s")))
(define-key global-map (kbd "s-g") 'isearch-forward-regexp)
(define-key isearch-mode-map (kbd "s-g") (lookup-key isearch-mode-map (kbd "C-s")))
(define-key minibuffer-local-isearch-map (kbd "s-g") (lookup-key minibuffer-local-isearch-map (kbd "C-s")))

;; search backward with Alt-f
(global-set-key (kbd "M-f") 'isearch-backward)
(define-key isearch-mode-map (kbd "M-f") (lookup-key isearch-mode-map (kbd "\C-r")))
(define-key minibuffer-local-isearch-map (kbd "M-f") (lookup-key minibuffer-local-isearch-map (kbd "C-r")))

;; swap return and control-j
(let ((c-j (lookup-key global-map (kbd "RET")))
      (ret (lookup-key global-map (kbd "C-j"))))
  (define-key lori-minor-mode-map (kbd "RET") ret)
  (define-key lori-minor-mode-map (kbd "C-j") c-j)
  (define-key global-map (kbd "s-<return>") c-j))

;; icy-mode comes last so that it can get an understanding of the key maps.
(icy-mode t)
