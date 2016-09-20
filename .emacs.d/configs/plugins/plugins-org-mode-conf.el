(require 'org-install)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keywords
       '((sequence "TODO" "WIP" "PENDING" "|" "DONE")))
(setq org-todo-keyword-faces
'(("TODO". (:foreground "red" :weight bold))
("WIP". (:foreground "#57b0ff" :weight bold))
("PENDING". (:foreground "orange" :weight bold))
("DONE". (:foreground "green" :weight bold)))
)

(global-font-lock-mode 1)

(provide 'plugins-org-mode-conf)
