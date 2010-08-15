;; clojure
(vendor 'clojure-mode)
(setq auto-mode-alist (cons '("\\.clj" . clojure-mode) auto-mode-alist))
;; paredit support
(require 'paredit)
(defun lisp-enable-paredit-hook () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)

