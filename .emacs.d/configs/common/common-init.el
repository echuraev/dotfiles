;; System-type definition
(defun system-is-linux()
  (string-equal system-type "gnu/linux"))
(defun system-is-darwin()
  (string-equal system-type "darwin"))
(defun system-is-windows()
  (string-equal system-type "windows-nt"))

(provide 'common-init)
