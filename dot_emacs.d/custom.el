(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-interval 0.45)
 '(bookmark-default-file "~/.emacs.d/bookmarks.el")
 '(bookmark-save-flag 0)
 '(byte-compile-verbose nil)
 '(byte-compile-warnings (quote (unresolved suspicious)))
 '(c-basic-offset 2)
 '(cua-auto-tabify-rectangles nil)
 '(cua-keep-region-after-copy t)
 '(default-frame-alist (quote ((height . 60) (width . 120) (menu-bar-lines . 1) (tool-bar-lines . 0) (background-color . "#000000") (foreground-color . "#FFFFFF") (cursor-color . "#DAD085") (cursor-type . bar))))
 '(delete-selection-mode t)
 '(elisp-cache-byte-compile-files t)
 '(elisp-cache-symlink-sources t)
 '(eshell-scroll-to-bottom-on-output (quote all))
 '(icicle-file-sort (quote icicle-dirs-last-p))
 '(icicle-top-level-key-bindings (quote (([pause] icicle-switch-to/from-minibuffer t) ([3 67108960] icicle-search-generic t) ([3 67108900] icicle-search-word t) ("" icicle-search-keywords t) ([3 67108903] icicle-occur t) ([3 67108925] icicle-imenu t) ([3 67108898] icicle-search-text-property t) ([3 67108911] icicle-complete-thesaurus-entry t) ([24 134217829] icicle-execute-named-keyboard-macro t) (" " icicle-command-abbrev t) ("5o" icicle-select-frame t) ("" icicle-describe-option-of-type t) ([S-f4] icicle-kmacro t) (abort-recursive-edit icicle-abort-recursive-edit t) (bookmark-jump icicle-bookmark t) (bookmark-jump-other-window icicle-bookmark-other-window t) (bookmark-set icicle-bookmark-cmd t) (minibuffer-keyboard-quit icicle-abort-recursive-edit (fboundp (quote minibuffer-keyboard-quit))) (delete-window icicle-delete-window t) (delete-windows-for icicle-delete-window t) (dired icicle-dired t) (dired-other-window icicle-dired-other-window t) (exchange-point-and-mark icicle-exchange-point-and-mark t) (execute-extended-command icicle-execute-extended-command t) (find-file icicle-file t) (find-file-other-window icicle-file-other-window t) (find-file-read-only icicle-find-file-read-only t) (find-file-read-only-other-window icicle-find-file-read-only-other-window t) (insert-buffer icicle-insert-buffer t) (kill-buffer icicle-kill-buffer t) (kill-buffer-and-its-windows icicle-kill-buffer t) (other-window icicle-other-window-or-frame t) (other-window-or-frame icicle-other-window-or-frame t) (pop-global-mark icicle-goto-global-marker-or-pop-global-mark t) (set-mark-command icicle-goto-marker-or-set-mark-command t) (switch-to-buffer icicle-buffer t) (switch-to-buffer-other-window icicle-buffer-other-window t) (where-is icicle-where-is t) (yank icicle-yank-maybe-completing t) (bmkp-bookmark-list-jump icicle-bookmark-bookmark-list (featurep (quote bookmark+))) (bmkp-desktop-jump icicle-bookmark-desktop (featurep (quote bookmark+))) (bmkp-dired-jump icicle-bookmark-dired (featurep (quote bookmark+))) (bmkp-dired-jump-other-window icicle-bookmark-dired-other-window (featurep (quote bookmark+))) (bmkp-file-jump icicle-bookmark-file (featurep (quote bookmark+))) (bmkp-file-jump-other-window icicle-bookmark-file-other-window (featurep (quote bookmark+))) (bmkp-gnus-jump icicle-bookmark-gnus (featurep (quote bookmark+))) (bmkp-gnus-jump-other-window icicle-bookmark-gnus-other-window (featurep (quote bookmark+))) (bmkp-info-jump icicle-bookmark-info (featurep (quote bookmark+))) (bmkp-info-jump-other-window icicle-bookmark-info-other-window (featurep (quote bookmark+))) (bmkp-local-file-jump icicle-bookmark-local-file (featurep (quote bookmark+))) (bmkp-local-file-jump-other-window icicle-bookmark-local-file-other-window (featurep (quote bookmark+))) (bmkp-man-jump icicle-bookmark-man (featurep (quote bookmark+))) (bmkp-man-jump-other-window icicle-bookmark-man-other-window (featurep (quote bookmark+))) (bmkp-non-file-jump icicle-bookmark-non-file (featurep (quote bookmark+))) (bmkp-non-file-jump-other-window icicle-bookmark-non-file-other-window (featurep (quote bookmark+))) (bmkp-region-jump icicle-bookmark-region (featurep (quote bookmark+))) (bmkp-region-jump-other-window icicle-bookmark-region-other-window (featurep (quote bookmark+))) (bmkp-remote-file-jump icicle-bookmark-remote-file (featurep (quote bookmark+))) (bmkp-remote-file-jump-other-window icicle-bookmark-remote-file-other-window (featurep (quote bookmark+))) (bmkp-specific-buffers-jump icicle-bookmark-specific-buffers (featurep (quote bookmark+))) (bmkp-specific-buffers-jump-other-window icicle-bookmark-specific-buffers-other-window (featurep (quote bookmark+))) (bmkp-specific-files-jump icicle-bookmark-specific-files (featurep (quote bookmark+))) (bmkp-specific-files-jump-other-window icicle-bookmark-specific-files-other-window (featurep (quote bookmark+))) (bmkp-this-buffer-jump icicle-bookmark-this-buffer (featurep (quote bookmark+))) (bmkp-this-buffer-jump-other-window icicle-bookmark-this-buffer-other-window (featurep (quote bookmark+))) (bmkp-all-tags-jump icicle-bookmark-all-tags (featurep (quote bookmark+))) (bmkp-all-tags-jump-other-window icicle-bookmark-all-tags-other-window (featurep (quote bookmark+))) (bmkp-all-tags-jump icicle-bookmark-all-tags-regexp (featurep (quote bookmark+))) (bmkp-all-tags-regexp-jump-other-window icicle-bookmark-all-tags-regexp-other-window (featurep (quote bookmark+))) (bmkp-some-tags-jump icicle-bookmark-some-tags (featurep (quote bookmark+))) (bmkp-some-tags-jump-other-window icicle-bookmark-some-tags-other-window (featurep (quote bookmark+))) (bmkp-some-tags-jump icicle-bookmark-some-tags-regexp (featurep (quote bookmark+))) (bmkp-some-tags-regexp-jump-other-window icicle-bookmark-some-tags-regexp-other-window (featurep (quote bookmark+))) (bmkp-url-jump icicle-bookmark-url (featurep (quote bookmark+))) (bmkp-url-jump-other-window icicle-bookmark-url-other-window (featurep (quote bookmark+))) (bmkp-w3m-jump icicle-bookmark-w3m (featurep (quote bookmark+))) (bmkp-w3m-jump-other-window icicle-bookmark-w3m-other-window (featurep (quote bookmark+))) (find-tag icicle-find-tag (fboundp (quote command-remapping))) (find-tag-other-window icicle-find-first-tag-other-window t) (pop-tag-mark icicle-pop-tag-mark (fboundp (quote command-remapping))) (eval-expression icicle-pp-eval-expression (fboundp (quote command-remapping))) (pp-eval-expression icicle-pp-eval-expression (fboundp (quote command-remapping))) ([27 134217848] lacarte-execute-command (fboundp (quote lacarte-execute-command))) ([134217824] lacarte-execute-menu-command (fboundp (quote lacarte-execute-menu-command))) ([f10] lacarte-execute-menu-command (fboundp (quote lacarte-execute-menu-command))))))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote ((up . right) (down . right))))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((menu-bar-lines . 1) (cursor-type . bar))))
 '(js-indent-level 2)
 '(make-backup-files nil)
 '(mouse-drag-copy-region nil)
 '(mouse-wheel-scroll-amount (quote (1)))
 '(normal-erase-is-backspace t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby"))))
 '(scroll-conservatively 1)
 '(scroll-preserve-screen-position 1)
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-width 2)
 '(term-default-bg-color "#000000")
 '(term-default-fg-color "#dddddd")
 '(visible-cursor nil)
 '(yas/trigger-key "<M-tab>"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cursor ((t (:inherit nil :background "#aaaaaa" :inverse-video t))))
 '(erb-face ((((class color) (min-colors 88) (background dark)) (:background "#252525"))))
 '(erb-out-delim-face ((((background dark)) (:background "#252525" :foreground "#aaffff"))))
 '(fringe ((((class color) (background dark)) (:background "grey10" :foreground "grey"))))
 '(isearch ((((class color) (min-colors 88) (background dark)) (:background "#315" :foreground "#b8f"))))
 '(isearch-fail ((((class color) (min-colors 88) (background dark)) (:background "#522" :foreground "#Fcc"))))
 '(lazy-highlight ((((class color) (min-colors 88) (background dark)) (:background "#235"))))
 '(magit-item-highlight ((((class color) (background dark)) (:background "#272727"))))
 '(region ((((class color) (min-colors 88) (background dark)) (:background "#000055"))))
 '(show-paren-match ((((class color) (background dark)) (:background "steelblue4"))))
 '(show-paren-mismatch ((((class color)) (:background "#550088" :foreground "white")))))
