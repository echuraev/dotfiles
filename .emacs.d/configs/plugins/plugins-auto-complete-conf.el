;    ; start auto-complete with emacs
;    (require 'auto-complete)
;    ; do default config for auto-complete
;    (require 'auto-complete-config)
;    (ac-config-default)
;    ; auto-complete-c-headers function
;    (defun my:ac-c-header-init()
;      (require 'auto-complete-c-headers)
;      (add-to-list 'ac-sources 'ac-source-c-headers)
;      (add-to-list 'achead:include-directories '"/opt/intel/composer_xe_2015.2.164/ipp/include")
;      (add-to-list 'achead:include-directories '"/opt/intel/composer_xe_2015.2.164/mkl/include")
;      (add-to-list 'achead:include-directories '"/opt/intel/composer_xe_2015.2.164/tbb/include")
;      (add-to-list 'achead:include-directories '"/usr/include/c++/4.9")
;      (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.9")
;      (add-to-list 'achead:include-directories '"/usr/include/c++/4.9/backward")
;      (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include")
;      (add-to-list 'achead:include-directories '"/usr/local/include")
;      (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.9/include-fixed")
;      (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
;      (add-to-list 'achead:include-directories '"/usr/include")
;    )
;    ; call this function from c/c++ hooks
;    (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;    (add-hook 'c-mode-hook 'my:ac-c-header-init)

;;; enable company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; enable irony-mode
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;;; replace the `completion-at-point' and `complete-symbol' bindings in
;;; irony-mode's buffers by irony-mode's function
(defun my:irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my:irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;;; enable C++17 support in clang
(setq irony-additional-clang-options '("-std=c++1z"))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;;; Semantic on
(require 'semantic)
(semantic-mode 1)

;;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
;; Completing point by some yasnippet key
(defun yas-ido-expand ()
  "Lets you select (and expand) a yasnippet key"
  (interactive)
  (let ((original-point (point)))
    (while (and
	    (not (= (point) (point-min) ))
	    (not
	     (string-match "[[:space:]\n]" (char-to-string (char-before)))))
      (backward-word 1))
    (let* ((init-word (point))
	   (word (buffer-substring init-word original-point))
	   (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
		  (lambda (s) (string-match (concat "^" word) s)) list)))
	(if (= (length key) 1)
	    (setq key (pop key))
	  (setq key (ido-completing-read "key: " list nil nil word)))
	(delete-char (- init-word original-point))
	(insert key)
		(yas-expand)))))
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-ido-expand)

(provide 'plugins-auto-complete-conf)
