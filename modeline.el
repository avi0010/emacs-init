(defun mode-line-fill (face reserve)
          "Return empty space using FACE and leaving RESERVE space on the right."
          (when
              (and window-system (eq 'right (get-scroll-bar-mode)))
            (setq reserve (- reserve 3)))
          (propertize " "
                      'display
                      `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
                      'face face
                      )
          )

        (use-package nyan-mode
          :config
          (setq nyan-bar-length 15)
          )
        (require 'nyan-mode)

        ;;;(let (sndr-font-base (cdr (assoc "zenbu-salmon" zenbu-colors-alist)) )
        ;; ■◧  ▥

        (defun get-evil-state-icons()
          (interactive)
          (cond
           ((memq evil-state '(emacs))
            (propertize "⭘ ⭘" 'face '((:foreground "orange" :weight bold )))
            )

           ((memq evil-state '(hybrid insert))
            (propertize " " 'face '((:foreground "green" :weight bold )))
            )

           ((memq evil-state '(visual))
            (propertize "⭘ ⭘" 'face '((:foreground "red" :weight bold )))
            )

           (t
            (propertize "⭘ ⭘" 'face '((:weight ultra-light )))
            )
           )
          )

        (setq-default mode-line-format
                      (list
                       " "
                       '(:eval (get-evil-state-icons) );; end evil-state
                       " "
                       '(:eval (when buffer-read-only
                                 (propertize " " 'help-echo "Buffer is read-only")))
                       '(:eval
                         (if (buffer-modified-p)
                             (propertize " %b " 'face '((:weight bold )) 'help-echo (buffer-file-name) )
                           (propertize "%b " 'help-echo (buffer-file-name))
                           ))
                       (propertize " · " 'face 'font-lock-type-face)
                       ;; '%02' to set to 2 chars at least; prevents flickering
                       (propertize "%02l, %02c" 'face 'font-lock-type-face)
                       ;; the current major mode for the buffer.
                       (propertize " · %m ·" 'face 'font-lock-type-face)
                       mode-line-misc-info
                       (propertize " · " 'face 'font-lock-type-face)
                       (mode-line-fill 'mode-line 30)
                       (propertize " · " 'face 'font-lock-type-face)
                       '(:eval (list (nyan-create)))
                       (propertize " · " 'face 'font-lock-type-face)
                       '(:eval (if-let (vc vc-mode)
                                   (list "  " (substring vc 5))
                                 (list "        " )
                                 ))
                       ))


