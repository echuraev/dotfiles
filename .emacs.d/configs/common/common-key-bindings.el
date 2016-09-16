(when (eq system-type 'darwin) ;; mac specific settings
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(global-set-key (kbd "M-h") 'shrink-window-horizontally)
(global-set-key (kbd "M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "M-j") 'shrink-window)
(global-set-key (kbd "M-k") 'enlarge-window)

(provide 'common-key-bindings)
