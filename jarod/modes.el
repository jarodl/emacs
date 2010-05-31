;; others
(load "jarod/ruby")
(load "jarod/shell")
(load "jarod/javascript")
(load "jarod/python")
(load "jarod/sgml")
(load "jarod/coffee")
(load "jarod/markdown")

;; all modes
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; emacs
(define-key emacs-lisp-mode-map (kbd "A-r") 'eval-buffer)

; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

; paredit
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

; mode-compile
(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

; css
(setq css-mode-indent-depth 2)
(add-hook 'css-mode-hook '(lambda ()
                            (define-key css-mode-map [tab] 'defunkt-indent)))


; yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


; c
(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-auto-newline t)
             (define-key c-mode-map "{" 'defunkt/c-electric-brace)))

;; mustache
(add-to-list 'auto-mode-alist '("\\.mustache$" . tpl-mode))

;; textmate.el
(vendor 'textmate)
(textmate-mode)
(setq textmate-find-files-command "git ls-tree --full-tree --name-only -r HEAD")