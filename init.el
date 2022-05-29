(defvar efs/frame-transparency '(100 . 100))
(setq gc-cons-threshold (* 90 1000 1000))
(load "~/.emacs.d/setup.el")
(load "~/.emacs.d/basic.el")
(load "~/.emacs.d/org.el")
(load "~/.emacs.d/neotree.el")
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(load "~/.emacs.d/keybindings.el")
(load "~/.emacs.d/modeline.el")
(setq gc-cons-threshold (* 2 1000 1000))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" default))
 '(git-gutter:added-sign " ")
 '(git-gutter:deleted-sign " ")
 '(git-gutter:modified-sign " ")
 '(git-gutter:window-width 1)
 '(org-babel-C++-compiler "clang++")
 '(package-selected-packages
   '(git-gutter all-the-icons-ivy password-store clippy dap-mode rainbow-mode doom-modeline autothemer treemacs-all-the-icons treemacs-magit treemacs-projectile neotree minimap beacon lsp-latex highlight-parentheses ac-ispell pdf-tools yaml-mode go-mode auctex prettier-js tagedit rjsx-mode vterm lsp-jedi lsp-mode which-key use-package rainbow-delimiters org-super-agenda no-littering magit ivy-rich ivy-prescient helpful general evil-collection doom-themes dashboard counsel-projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
