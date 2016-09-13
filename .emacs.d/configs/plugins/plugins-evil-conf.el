; Evil mode
(require 'evil)
(evil-mode 1)
(require 'linum-relative)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")
(setq linum-relative-format "%4s \u2502 ")

(provide 'plugins-evil-conf)
