;;; help.el --- A better help
;;; Commentary:
;;; Code:

(use-package helpful)

(use-package info-colors
  :hook
  (Info-selection #'info-colors-fontify-node))

(use-package devdocs)

(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-idle-delay 0.5
		which-key-min-display-lines 30
        which-key-max-description-length 166
        which-key-show-docstrings t)
  (which-key-mode 1))
(use-package which-key-posframe
  :after which-key
  :custom
  (which-key-posframe-border-width 2)
  :config
  (which-key-posframe-mode 1))

;;; TODO: try https://github.com/abo-abo/hydra, https://github.com/wurosh/hercules

(message "==> INIT: help.el")

(provide 'help)

;;; help.el ends here
