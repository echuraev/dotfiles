;(setq url-proxy-services '(("http" . "proxy-chain.intel.com:911")))
; START package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

; Auto install

; list the packages you want
(defconst packages-list '(
		     auto-complete
		     auto-complete-c-headers
		     evil
		     idea-darkula-theme
		     linum-relative
		     yasnippet
		     llvm-mode
		     opencl-mode
		     ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package packages-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)
;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/configs")
(require 'configs-init)

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
