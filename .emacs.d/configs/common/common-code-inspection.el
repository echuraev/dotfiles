(require 'flycheck)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(eval-after-load 'flycheck 
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
   
; Enable C++11 support for clang
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))

(provide 'common-code-inspection)
