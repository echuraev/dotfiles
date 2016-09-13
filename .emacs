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

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; auto-complete-c-headers function
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/opt/intel/composer_xe_2015.2.164/ipp/include")
  (add-to-list 'achead:include-directories '"/opt/intel/composer_xe_2015.2.164/mkl/include")
  (add-to-list 'achead:include-directories '"/opt/intel/composer_xe_2015.2.164/tbb/include")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.9")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.9")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.9/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include")
)
; call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Evil mode
(require 'evil)
(evil-mode 1)
(require 'linum-relative)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")
(setq linum-relative-format "%4s \u2502 ")

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
