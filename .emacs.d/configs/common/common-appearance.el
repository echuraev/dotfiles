; turn off panels
(menu-bar-mode -1)
(tool-bar-mode -1)
(unless (system-is-darwin)
  (scroll-bar-mode -1))

; show column in comand line
(column-number-mode)

; show paren
(show-paren-mode)

; Theme
(require 'idea-darkula-theme)
(deftheme idea-drakula "Theme based on IntelliJ IDEA drakula theme")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'powerline)
(if (display-graphic-p)
    (powerline-evil-center-color-theme)
  (powerline-evil-vim-color-theme))
(when (display-graphic-p)
  (setq powerline-default-separator 'contour))
(setq powerline-evil-tag-style 'verbose)
;(display-time-mode t)

(provide 'common-appearance)
