;; Initialize package sources
(defvar efs/frame-transparency '(98 . 98))
(setq gc-cons-threshold (* 90 1000 1000))
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))



(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)


(use-package no-littering)
(electric-pair-mode 1)

;; The default is 800 kilobytes.  Measured in bytes.

(setq dashboard-centre-content t)
(setq dashboard-items '((recents  . 3)
                        (bookmarks . 3)
                        (projects . 3)
                        (agenda . 5)))
;(add-to-list 'dashboard-items '(agenda) t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
;;(setq dashboard-set-init-info t)
(setq dashboard-week-agenda nil)
(setq dashboard-startup-banner "/home/aveekal/Downloads/skull2.jpg")
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


;; StartUp
(setq inhibit-startup-message t)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)            ; Disable the menu bar
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))

;; Set up the visible bell
(setq visible-bell t)
(column-number-mode)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(set-face-attribute 'default nil :font "Cascadia Mono" :height 120)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
		vterm-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package doom-themes
  :init (load-theme 'doom-horizon t))

(use-package all-the-icons
  :defer 0)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)
	   (doom-modeline-lsp t)
	   (doom-modeline-hud nil)
	   (doom-modeline-project-detection 'auto)))

(use-package rainbow-delimiters
  :defer 0
  :hook (prog-mode . rainbow-delimiters-mode))

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

(use-package ivy-prescient
  :after counsel
  :config
  (ivy-prescient-mode 1))

(use-package helpful
  :defer 1
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

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
    "bb" '(counsel-switch-buffer :which-key "List Buffers")
    "bt" '(counsel-switch-to-shell-buffer :which-key "shell buffer")
    "bs" '(save-buffer :which-key "save Buffer")
    "bp" '(previous-buffer :which-key "previous buffer")
    "bn" '(next-buffer :which-key "next-buffer")
    "bk" '(kill-current-buffer :which-key "kill current buffer") 
    "bS" ' (save-all :which-key "save all Buffers")
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

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package magit)

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
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.05)
                  (org-level-6 . 1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1)))
    (set-face-attribute (car face) nil :font "CascadiaMono" :height (cdr face))))

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

(defun avi/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode)
  (setq lsp-modeline-code-actions-enable t))


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . avi/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))
(use-package lsp-treemacs
  :after lsp)

(lsp-treemacs-sync-mode 1)
(use-package lsp-ivy
  :after lsp)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
        ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
  ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))


(use-package company-prescient
  :after company
  :config
  (company-prescient-mode 1))


;; Remember candidate frequencies across sessions
(prescient-persist-mode 1)

(use-package js2-mode
  :defer 0
  :mode "\\.js\\'"
  :hook (js2-mode . lsp))
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)

(use-package js2-refactor
  :after js2-mode
  :hook (js-mode-hook . js2-refactor-mode))

(use-package prettier
  :defer 0)
(add-hook 'js2-mode-hook 'prettier-js-mode)

(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 4)))
(setq lsp-tailwindcss-add-on-mode t)
(use-package lsp-tailwindcss
  :defer 0)

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

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single
  :after dired)

(use-package all-the-icons-dired
  :after dired
  :hook (dired-mode . all-the-icons-dired-mode))

(setq python-shell-interpreter "~/.pyenv/versions/3.10.1/bin/python")
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))  ; or lsp-deferred
(setq lsp-pylsp-plugins-autopep8-enabled t)
(setq lsp-pylsp-plugins-jedi-completion-fuzzy t)
(setq tagedit-add-experimental-features t)
(eval-after-load 'sgml-mode
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
(use-package pyvenv
  :ensure t
  :init
  (setenv "~/.pyenv/versions"))
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'go-mode-hook 'lsp)
(yas-global-mode t)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))
(global-prettify-symbols-mode 't)
;;PATHS
(add-to-list 'exec-path "~/go/bin")
(add-hook 'org-mode-hook 'ac-ispell-ac-setup)
(setq show-paren-mode t)

(require 'lsp-latex)
;; "texlab" must be located at a directory contained in `exec-path'.
;; If you want to put "texlab" somewhere else,
;; you can specify the path to "texlab" as follows:
;; (setq lsp-latex-texlab-executable "/path/to/texlab")

(with-eval-after-load "tex-mode"
 (add-hook 'tex-mode-hook 'lsp)
 (add-hook 'latex-mode-hook 'lsp))

(setq gc-cons-threshold (* 2 1000 1000))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-C++-compiler "clang++")
 '(package-selected-packages
   '(lsp-latex highlight-parentheses ac-ispell pdf-tools yaml-mode go-mode auctex prettier-js tagedit rjsx-mode vterm lsp-jedi lsp-mode which-key use-package rainbow-delimiters org-super-agenda no-littering magit ivy-rich ivy-prescient helpful general evil-collection doom-themes doom-modeline dashboard counsel-projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
