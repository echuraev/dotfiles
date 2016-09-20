; START package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

; Auto install

; list the packages you want
(defconst packages-list '(
		     auto-complete                    ; Auto completion
		     auto-complete-c-headers          ; Auto complete c headers

		     evil                             ; Vim mode for emacs
		     linum-relative                   ; Relative numbers for evil mode
		     highlight
		     evil-search-highlight-persist    ; persistently search highlighting

		     idea-darkula-theme               ; Theme
		     yasnippet                        ; snippets
		     llvm-mode                        ; Syntax highlighting for llvm and spirv
		     opencl-mode                      ; Syntax highlighting for opencl
		     powerline-evil                   ; Powerline for evil
		     ;tabbar                           ; Tabs
		     cmake-mode                       ; Show cmake syntax
		     projectile                       ; Project

		     ecb                              ; Emacs Code Browser
		     ws-butler                        ; Remove spaces from end of line
		     irony                            ; Auto-complete server
		     company                          ; Auto-complete
		     company-irony                                 
		     company-c-headers                             
		     company-irony-c-headers                       
		     flycheck-irony                   ; Code check   
	     
		     helm                             ; Complete all 
		     helm-gtags                                    
		     helm-projectile                              
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "8f0334c430540bf45dbcbc06184a2e8cb01145f0ae1027ce6b1c40876144c0c9" default)))
 '(package-selected-packages
   (quote
    (projectile yasnippet powerline-evil opencl-mode llvm-mode linum-relative idea-darkula-theme cmake-mode auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
