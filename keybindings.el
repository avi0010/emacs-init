(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.1))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :bind (("M-x" . counsel-M-x)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)
  (counsel-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(ivy-rich-mode 0)
(ivy-rich-mode 1)
(setq ivy-prescient-enable-filtering nil)
(use-package ivy-prescient
  :after counsel
  :config
  (ivy-prescient-mode 1))

(defun save-all () (interactive) (save-some-buffers t))
(use-package general
  :after evil
  :config
  (general-create-definer avi/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
  
  (avi/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "." '(counsel-find-file :which-key "Find File")
    ;; Buffers
    "bb" '(counsel-switch-buffer :which-key "List Buffers")
    "bt" '(counsel-switch-to-shell-buffer :which-key "shell buffer")
    "bs" '(save-buffer :which-key "save Buffer")
    "bp" '(previous-buffer :which-key "previous buffer")
    "bn" '(next-buffer :which-key "next-buffer")
    "bk" '(kill-current-buffer :which-key "kill current buffer") 
    "bS" ' (save-all :which-key "save all Buffers")
    ;; Org Mode
    "o"  '(:which-key "Org mode")
    "oa" '(org-agenda-list :which-key "Org TODO list")
    "os" '(org-schedule :which-key "Org schedule")
    ))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  (setq projectile-switch-project-action #'projectile-dired))

(load "~/.emacs.d/org.el")

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package magit
  :defer 0)

(use-package dired
  :after evil
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single
  :defer 0
  :after dired)

(use-package all-the-icons-dired
  :defer 0
  :after dired
  :hook (dired-mode . all-the-icons-dired-mode))

