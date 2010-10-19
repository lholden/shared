(setq ls-lisp-dirs-firest t
      custom-file (expand-file-name "~/.emacs.d/custom.el")
      slime-helper (expand-file-name "~/.quicklisp/slime-helper.el")
      inferior-lisp-program (expand-file-name "~/.local/bin/sbcl")
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;; Startup server so emacsclient can connect
(server-start)

;; Load emacs settings
(load custom-file)

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
(require 'redo)
(require 'icomplete)
(require 'icomplete+)

;; CUA
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)
(transient-mark-mode 1)
(setq cua-keep-region-after-copy t)

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

;; TextMate Mode
(require 'textmate)
(textmate-mode)

;; eshell
(defun eshell/emacs (file)
  (find-file file))
(defun eshell/open (file)
  (find-file file))
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; Icicles
(require 'icicles)
(setq icicle-buffers-ido-like-flag t)

;; Org Mode
(require 'org-install)


;; Customization
(defalias 'open 'find-file)
(defalias 'sh 'eshell)
(setq ring-bell-function (lambda () ))
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode 1)

(defadvice kill-line (before check-position activate)
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1))))

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

;; Key bindings
(windmove-default-keybindings 'control) ;; meta+direction
(define-key global-map (kbd "M-/") 'hippie-expand)
(define-key global-map (kbd "C-c y") 'bury-buffer)
(define-key global-map (kbd "C-c r") 'revert-buffer)
(define-key global-map (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "C-s") 'isearch-forward-regexp)
(define-key global-map (kbd "C-r") 'isearch-backward-regexp)
(define-key global-map (kbd "C-M-s") 'isearch-forward)
(define-key global-map (kbd "C-M-r") 'isearch-backward)
(define-key global-map (kbd "C-x m") 'eshell)
(define-key global-map (kbd "C-x M") (lambda () (interactive) (eshell t)))
(define-key global-map (kbd "M-g s") 'magit-status)

(define-key global-map (kbd "s-o") 'vi-open-line-below)
(define-key global-map (kbd "s-O") 'vi-open-line-above)
(define-key global-map (kbd "s-z") 'undo)
(define-key global-map (kbd "s-Z") 'redo)
(define-key global-map (kbd "s-b") 'icicle-buffer)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-j") 'newline)

(defvar lori-minor-mode-map (make-keymap) "lori-minor-mode keymap.")
(define-minor-mode lori-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " lori" 'lori-minor-mode-map)

(define-key lori-minor-mode-map '[s-left] 'beginning-of-line)
(define-key lori-minor-mode-map '[s-right] 'end-of-line) 
(define-key lori-minor-mode-map '[C-s-up] 'move-text-up)
(define-key lori-minor-mode-map '[C-s-down] 'move-text-down) 
(define-key lori-minor-mode-map (kbd "s-t") (lambda() 
                                              (setq current-prefix-arg (list 1))
                                              (interactive)
                                              (icicle-locate-file)))

;; Remove textmate-mode mappings I don't care for.
(define-key *textmate-mode-map* [(super meta return)] nil)
(define-key *textmate-mode-map* [(super meta \])] nil)
(define-key *textmate-mode-map* [(super meta \[)] nil)
(define-key *textmate-mode-map* [(super t)] nil)
(define-key *textmate-mode-map* [(meta up)] nil)
(define-key *textmate-mode-map* [(meta down)] nil)
(define-key *textmate-mode-map* [(meta shift up)] nil)
(define-key *textmate-mode-map* [(meta shift down)] nil)

(add-hook 'minibuffer-setup-hook (lambda() (lori-minor-mode 0)))
(lori-minor-mode 1)
(icy-mode t)
