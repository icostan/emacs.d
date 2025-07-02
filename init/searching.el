;;; searching.el --- Searching essentials
;;; Commentary:
;;; Code:

(use-package rg
  :defer t
  :ensure-system-package (rg . ripgrep))
(use-package nerd-icons-grep
  :init
  (nerd-icons-grep-mode)
  :custom
  ;; This setting is a pre-requirement, so an icon can be displayed near each
  ;; heading
  (grep-use-headings t))

(use-package ag
  :defer t
  :ensure-system-package (ag . the_silver_searcher)
  :custom
  (ag-highlight-search t "Highlight the current search term."))

(use-package dumb-jump
  ;; :general
  ;; (general-nmap
  ;;   "g D" '(dumb-jump-go :wk "dumb jump")
  ;;   "g B" '(xref-pop-marker-stack :wk "xref go back"))
  :defer t
  :init
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  :custom
  (dumb-jump-selector 'completing-read)
  (dumb-jump-prefer-searcher 'ag))

(use-package dumber-jump
  ;; :general
  ;; (general-nmap
  ;;   "g R" '(dumber-jump :wk "dumber jump"))
  :config
  (add-hook 'xref-backend-functions #'dumber-jump-xref-activate))

;; (use-package counsel
;;   :config
;;   (setq minimap-width-fraction 0.1))

(message "==> INIT: searching.el")

(provide 'searching)

;;; searching.el ends here
