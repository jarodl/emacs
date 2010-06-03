(add-to-list 'load-path "~/.emacs.d/vendor")

(load "jarod/lisp")
(load "jarod/global")
(load "jarod/defuns")
(load "jarod/bindings")
(load "jarod/modes")
(load "jarod/theme")
(load "jarod/git")
(load "jarod/todo")
(load "jarod/ruby")
(load "jarod/scala")
(load "jarod/maxframe")
(load "jarod/markdown")

(vendor 'cheat)
(vendor 'magit)
(vendor 'gist)
(vendor 'yaml-mode)
(vendor 'coffee-mode)
(vendor 'color-theme)

;; full screen
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; show line numbers
(require 'linum)
(global-linum-mode 1)

;; don't use the arrow keys
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

;; use UTF-8
(prefer-coding-system 'utf-8)

;; don't make backup files
(setq make-backup-files nil)

;; disable auto-saving
(setq auto-save-default nil)

;; set font face
(set-face-font 'default "-andale-mono-medium-r-normal--12-0-72-72-m-0-iso10646-1")

;; Highlight characters after 80 cols
(setq whitespace-style '(lines-tail)
    whitespace-line-column 80)
(global-whitespace-mode 1)