(load-theme 'tsdh-dark)

(tool-bar-mode 1)
(menu-bar-mode 1)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(column-number-mode 1)
(context-menu-mode 1)
(electric-pair-mode 1)
(auto-save-visited-mode 1)

(use-package vertico	:ensure t :config (vertico-mode))
(use-package marginalia :ensure t :config (marginalia-mode))
(use-package company	:ensure t :config (global-company-mode))
(use-package magit	:ensure t :config (bind-key "C-c v" #'magit))

(setq backup-directory-alist `((".*" . ,(concat user-emacs-directory "backups")))
      custom-file (concat user-emacs-directory "custom.el")
      initial-scratch-message "")

(add-hook 'before-save-hook #'whitespace-cleanup)
(add-hook 'magit-mode-hook (lambda () (save-some-buffers t)))
