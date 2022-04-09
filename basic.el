(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(use-package dashboard
  :ensure t
  :init
  (setq dashboard-items '((recents  . 3)
                        (bookmarks . 3)
                        (projects . 3)
                        (agenda . 5)))
  (setq dashboard-centre-content t)
  (setq dashboard-startup-banner "~/Documents/emacs.png")
  (setq dashboard-week-agenda nil)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  :config
  (dashboard-setup-startup-hook))

;; StartUp
(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          
(electric-pair-mode 1)
(setq visible-bell t)
(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 120)

(use-package no-littering)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
		neotree-mode-hook
		vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package doom-themes
  :init (load-theme 'acid t))

(use-package all-the-icons
  :defer 0)

(use-package rainbow-delimiters
  :defer 0
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package autothemer
  :ensure t)
(use-package rainbow-mode
  :ensure t)


(beacon-mode 1)
