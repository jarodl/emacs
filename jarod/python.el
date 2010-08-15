(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\C-m"
              'python-reindent-then-newline-and-indent)
             (add-hook 'local-write-file-hooks
                        '(lambda()
                           (save-excursion
                             (untabify (point-min) (point-max))
                             (delete-trailing-whitespace))))
             (set (make-local-variable 'tab-width) 4)
             (set (make-local-variable 'indent-tabs-mode) 'nil)))

(defun python-previous-line-is-comment ()
  "Returns `t' if the previous line is a Python comment."
  (save-excursion
    (forward-line -1)
    (python-line-is-comment)))

(defun python-line-is-comment ()
  "Returns `t' if the current line is a Python comment."
  (save-excursion
    (beginning-of-line)
    (search-forward "#" (point-at-eol) t)))
