;;; searching.el --- Searching essentials
;;; Commentary:
;;; Code:

(use-package rg
  :defer t
  :ensure-system-package (rg . ripgrep))
(use-package ag
  :defer t
  :ensure-system-package (ag . the_silver_searcher)
  :custom
  (ag-highlight-search t "Highlight the current search term."))

(use-package dumb-jump
  :general
  (general-nmap
    "g D" '(dumb-jump-go :wk "dumb-goto-definition")
    "g B" '(xref-pop-marker-stack :wk "go back"))
  :defer t
  :custom
  (dumb-jump-selector 'completing-read)
  (dumb-jump-prefer-searcher 'ag))

(use-package minimap)
;; (use-package counsel
;;   :config
;;   (setq minimap-width-fraction 0.1))

(message "==> INIT: searching.el")

(provide 'searching)

;;; searching.el ends here
