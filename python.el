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
