;;; help.el --- A better help
;;; Commentary:
;;; Code:

(use-package helpful)

(use-package info-colors
  :hook
  (Info-selection #'info-colors-fontify-node))

(use-package devdocs)

(use-package which-key
  :init
  (setq which-key-separator " "
        which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))


(message "==> INIT: help.el")

(provide 'help)

;;; help.el ends here
