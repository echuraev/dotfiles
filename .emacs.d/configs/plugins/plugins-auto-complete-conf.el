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

(provide 'plugins-auto-complete-conf)
