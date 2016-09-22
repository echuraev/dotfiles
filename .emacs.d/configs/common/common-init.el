; Interactively Do Things
(ido-mode)

; Enable mouse support
(xterm-mouse-mode t)

; Trim spaces at the end of line
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

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
(require 'common-bkps-conf)
(require 'common-code-inspection)
(require 'common-debug)

(provide 'common-init)
