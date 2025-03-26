(load-theme 'tsdh-dark)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(column-number-mode 1)
(context-menu-mode 1)
(electric-pair-mode 1)
(auto-save-visited-mode 1)

(use-package vertico	:ensure t :config (vertico-mode))
(use-package marginalia :ensure t :config (marginalia-mode))
(use-package company	:ensure t :config (global-company-mode))
(use-package magit	:ensure t)

(setq backup-directory-alist `((".*" . ,(concat user-emacs-directory "backups")))
      custom-file (concat user-emacs-directory "custom.el")
      indent-tabs-mode nil
      require-final-newline t)

(add-hook 'eval-expression-minibuffer-setup-hook #'company-mode)
(add-hook 'before-save-hook #'whitespace-cleanup)
(add-hook 'magit-mode-hook (lambda () (save-some-buffers t)))
(add-hook 'window-state-change-hook (lambda () (save-some-buffers t)))
(add-function :after after-focus-change-function (lambda () (save-some-buffers t)))

(bind-key* "M-0" 'delete-window)
(bind-key* "M-1" 'delete-other-windows)
(bind-key* "M-2" 'split-window-vertically)
(bind-key* "M-3" 'split-window-horizontally)
(bind-key* "M-o" 'other-window)
(bind-key* "M-u" 'switch-to-buffer)
(bind-key* "M-l" 'find-file)
(bind-key* "M-j" 'dired-jump)
(bind-key* "M-m" 'magit)

;; Now, let the ediff plumbing commence
(setq ediff-window-setup-function #'ediff-setup-windows-plain
      ediff-split-window-function #'split-window-horizontally)

(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)
