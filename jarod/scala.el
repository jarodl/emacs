;; scala
(vendor 'scala-mode)
(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
          (lambda ()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max)))))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (define-key scala-mode-map "\C-m" 'scala-reindent-then-newline-and-indent)))

(defadvice scala-do-run-w/compilation (before kill-buffer (name cmdlist))
  (let ((comp-buffer-name (format "*%s*" name)))
    (when (get-buffer comp-buffer-name)
      (kill-buffer comp-buffer-name))))
(ad-activate 'scala-do-run-w/compilation)

; where'd this go?
(defun scala-reindent-then-newline-and-indent ()
  "Reindents the current line then creates an indented newline."
  (interactive "*")
  (newline)
  (save-excursion
    (end-of-line 0)
    (indent-according-to-mode)
    (delete-region (point) (progn (skip-chars-backward " \t") (point))))
  (when (scala-previous-line-is-comment)
      (insert "// "))
  (indent-according-to-mode))

(defun scala-previous-line-is-comment ()
  "Returns `t' if the previous line is a scala comment."
  (save-excursion
    (forward-line -1)
    (scala-line-is-comment)))

(defun scala-line-is-comment ()
  "Returns `t' if the current line is a scala comment."
  (save-excursion
    (beginning-of-line)
    (search-forward "//" (point-at-eol) t)))