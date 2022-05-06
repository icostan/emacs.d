;;; syntax-checking.el --- Syntax checking with Flycheck
;;; Commentary:
;;; Code:

(use-package flycheck
  :init (global-flycheck-mode))
;; (use-package flycheck-cask)

(use-package flymake-collection
  :hook (after-init . flymake-collection-hook-setup))
(use-package flymake-easy
  :quelpa (:fetcher github :repo "purcell/flymake-easy"))

(message "==> INIT: syntax-checking.el")

(provide 'syntax-checking)

;;; syntax-checking.el ends here
