;; general
(global-set-key "\C-R" 'replace-string)

;; no printing!
;; no changing meta key!!
(when (boundp 'osx-key-mode-map)
  ;; Option is my meta key.
  (define-key osx-key-mode-map (kbd "A-;")
    '(lambda () (interactive) (message "noop")))

  ;; What's paper?
  (define-key osx-key-mode-map (kbd "A-p")
    '(lambda () (interactive) (message "noop"))))