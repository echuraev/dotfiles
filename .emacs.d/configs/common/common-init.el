; turn off panels
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; ???
(ido-mode)

; show column in comand line
(column-number-mode)

; show paren
(show-paren-mode)

;; System-type definition
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))
(defun system-is-darwin()
  (string-equal system-type "darwin"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

(provide 'common-init)
