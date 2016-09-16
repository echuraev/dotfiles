; Interactively Do Things 
(ido-mode)

; Enable mouse support
(xterm-mouse-mode t)

;; System-type definition
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))
(defun system-is-darwin()
  (string-equal system-type "darwin"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

(require 'common-file-associating)
(require 'common-key-bindings)
(require 'common-appearance)

(provide 'common-init)
