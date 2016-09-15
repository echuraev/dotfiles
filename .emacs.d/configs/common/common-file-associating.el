; Setup files ending in “.spt or .ll” to open in llvm-mode
(require 'llvm-mode)
(add-to-list 'auto-mode-alist '("\\.spt\\'" . llvm-mode))
(add-to-list 'auto-mode-alist '("\\.ll\\'" . llvm-mode))

; Associating with opencl files
(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

(provide 'common-file-associating)
