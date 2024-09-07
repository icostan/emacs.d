;;; syntax-flymake.el --- flymake

;;; Commentary:
;;

;;; Code:

(use-package flymake)

(use-package flymake-collection
  :hook (after-init . flymake-collection-hook-setup))

(use-package flymake-easy)

(use-package flymake-margin
  :after flymake
  :config
  (flymake-margin-mode t))

(use-package sideline-flymake
  :after sideline)

(message "==> INIT: syntax-flymake.el")

(provide 'syntax-flymake)

;;; syntax-flymake.el ends here
