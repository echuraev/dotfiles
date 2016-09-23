;     _____________________________________________________________________________________
;    |                                          |                                          |
;    |              BREAKPOINTS                 |                                          |
;    |__________________________________________|                                          |
;    |                                          |                                          |
;    |                 STACK                    |                                          |
;    |__________________________________________|                                          |
;    |                                          |                                          |
;    |                                          |                                          |
;    |		       LOCALS                   |                                          |
;    |                                          |                                          |
;    |__________________________________________|                 SOURCE CODE              |
;    |                                          |                                          |
;    |                                          |                                          |
;    |                                          |                                          |
;    |                                          |                                          |
;    |                                          |                                          |
;    |                                          |                                          |
;    |                  GDB                     |                                          |
;    |                                          |                                          |
;    |                                          |                                          |
;    |                                          |__________________________________________|
;    |                                          |                                          |
;    |                                          |                    I/O                   |
;    |__________________________________________|__________________________________________|

;; invoke
(global-set-key [f8] 'gdb)

;; GDB layout
(defadvice gdb-setup-windows (after activate)
  (gdb-setup-my-windows)
)

(defun gdb-setup-my-windows ()
  (set-window-dedicated-p (selected-window) nil)
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows)
  (let
    ((win0 (selected-window))             ; breakpoints
     (win1 (split-window-horizontally
	     (floor (* 0.5 (window-width)))))   ; source
     (win2 (split-window-vertically
	     (floor (* 0.5 (window-body-height))))) ; gdb
     (win3 (split-window-vertically
	    (floor (* 0.5 (window-body-height))))) ; locals
     (win4 (split-window-vertically
	     (floor (* 0.6 (window-body-height))))) ; stack
    )
    ;; set source buffer
    (set-window-buffer
     win1
     (if gud-last-last-frame
	 (gud-find-file (car gud-last-last-frame))
       (if gdb-main-file
	   (gud-find-file gdb-main-file)
	 (list-buffers-noselect))))
    (setq gdb-source-window win1)

    (select-window win1)
    (split-window-vertically (floor (* 0.9 (window-body-height))))
    (other-window 1)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io))

    (set-window-buffer win0 (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (set-window-buffer win3 (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-buffer win4 (gdb-get-buffer-create 'gdb-stack-buffer))
    (select-window win2)
  )
)

;; GDB variables
(setq gdb-many-windows t)
(setq gdb-show-main t)
(setq gdb-show-changed-values t)
(setq gdb-use-colon-colon-notation t)
(setq gdb-use-separate-io-buffer nil)
(setq gdb-delete-out-of-scope t)
(setq gdb-speedbar-auto-raise t)

;; GDB highlight current line
(set-face-foreground 'secondary-selection "black")
(set-face-background 'secondary-selection "green")
(defvar gud-overlay
  (let* ((ov (make-overlay (point-min) (point-min))))
    (overlay-put ov 'face 'secondary-selection)
    ov)
  "Overlay variable for GUD highlighting.")
(defadvice gud-display-line (after my-gud-highlight act)
  "Highlight current line."
  (let* ((ov gud-overlay)
	 (bf (gud-find-file true-file)))
    (with-current-buffer bf
      (move-overlay ov (line-beginning-position)
		       (line-beginning-position 2)
		       (current-buffer)))))
(defun gud-kill-buffer ()
  (if (derived-mode-p 'gud-mode)
      (delete-overlay gud-overlay)))
(add-hook 'kill-buffer-hook 'gud-kill-buffer)

(provide 'common-debug)
