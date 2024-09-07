;;; syntax-flycheck.el --- Syntax checking with Flycheck
;;; Commentary:
;;; Code:

(use-package flycheck
  :init (global-flycheck-mode))

(use-package flycheck-eglot)

(use-package sideline-flycheck
  :hook (flycheck-mode . sideline-flycheck-setup))

(message "==> INIT: syntax-flycheck.el")

(provide 'syntax-flycheck)

;;; syntax-flycheck.el ends here
