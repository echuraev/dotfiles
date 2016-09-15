; Setup files ending in “.spt or .ll” to open in llvm-mode
(add-to-list 'auto-mode-alist '("\\.spt\\'" . llvm-mode))
(add-to-list 'auto-mode-alist '("\\.ll\\'" . llvm-mode))

(provide 'common-file-associating)
