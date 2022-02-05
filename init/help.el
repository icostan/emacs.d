;;; help.el --- A better help
;;; Commentary:
;;; Code:

(use-package helpful
  :custom
  (helpful-max-highlight 10000))

(use-package info-colors
  :hook
  (Info-selection #'info-colors-fontify-node))

(use-package devdocs)

;; g C-h - help keybinding prefix

(use-package which-key
  :diminish which-key-mode
  :custom
  (which-key-sort-order 'which-key-key-order-alpha)
  (which-key-idle-delay 0.5)
  (which-key-min-display-lines 30)
  (which-key-max-description-length 166)
  (which-key-show-docstrings nil)
  :config
  (which-key-add-key-based-replacements
    ", c" "comment"
    ", l" "comment (duplicated)"
    "C-c ," "semantic/senator"
    "C-c &" "yas"
    "C-c C-x" "edebug"
    "C-c !" "flycheck")
  (which-key-mode))

(use-package which-key-posframe
  :after which-key
  :custom
  (which-key-posframe-border-width 2)
  :config
  (which-key-posframe-mode))

;;; TODO: try https://github.com/abo-abo/hydra, https://github.com/wurosh/hercules

(message "==> INIT: help.el")

(provide 'help)

;;; help.el ends here
