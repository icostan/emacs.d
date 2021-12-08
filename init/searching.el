;;; searching.el --- Searching essentials
;;; Commentary:
;;; Code:

(use-package rg
  :defer t
  :ensure-system-package (rg . ripgrep))
(use-package ag
  :defer t
  :ensure-system-package (ag . the_silger_searcher)
  :custom
  (ag-highlight-search t "Highlight the current search term."))

(use-package dumb-jump
  :general
  (general-nmap "g D" '(dumb-jump-go :wk "dumb-goto-definition"))
  :defer t
  :custom
  (dumb-jump-selector 'helm)
  (dumb-jump-prefer-searcher 'ag))

(use-package minimap)
(use-package counsel
  :config
  (setq minimap-width-fraction 0.1))

(message "==> INIT: searching.el")

(provide 'searching)

;;; searching.el ends here
