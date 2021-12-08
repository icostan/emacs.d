;;; snippets.el --- Snippets
;;; Commentary:
;;; Code:

(use-package yasnippet
  :config (yas-global-mode 1))
(use-package yasnippet-snippets
  :after yasnippet)

(message "==> INIT: snippets.el")

(provide 'snippets)

;;; snippets.el ends here
