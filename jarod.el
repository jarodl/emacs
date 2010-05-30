(add-to-list 'load-path "~/.emacs.d/vendor")

; customizations
(setq custom-file "~/.emacs.d/jarod/custom.el")
(load custom-file)

(load "jarod/lisp")
(load "jarod/global")
(load "jarod/defuns")
(load "jarod/bindings")
(load "jarod/modes")
(load "jarod/theme")
(load "jarod/git")
(load "jarod/todo")

(vendor 'magit)
(vendor 'gist)
(vendor 'yaml-mode)
(vendor 'coffee-mode)