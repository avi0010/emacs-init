(defun avi/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun avi/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(dolist (face '((org-level-1 . 1.8)
                  (org-level-2 . 1.5)
                  (org-level-3 . 1.2)
                  (org-level-4 . 1)))
    (set-face-attribute (car face) nil :font "JetBrainsMono Nerd Font" :height (cdr face))))

(use-package org
  :defer 0
  :hook (org-mode . avi/org-mode-setup)
  :config
  (setq org-ellipsis " *")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files '("~/Emacs/Tasks/Tasks.org"))
  (avi/org-font-setup))
(use-package org-super-agenda
  :after org
  :config
  (setq org-agenda-start-day nil))

(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)
   (C . t)))


(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("lt" . "src LaTeX"))
  (add-to-list 'org-structure-template-alist '("cpp" . "src C++")))


(use-package org-roam
  :init
  (setq org-mode-v2-ack t)
  :custom
  (org-roam-directory "~/Emacs/Notes")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package websocket
    :after org-roam)

(use-package org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

