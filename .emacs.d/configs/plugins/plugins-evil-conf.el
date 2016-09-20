; Evil mode
(require 'evil)
(evil-mode 1)
(require 'linum-relative)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")
(if (system-is-darwin)
  (setq linum-relative-format "%4s | ")
  (setq linum-relative-format "%4s \u2502 ")
)

; Search highlighting
(require 'highlight)
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)

(provide 'plugins-evil-conf)
