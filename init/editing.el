;;; editing.el --- Editing essentials
;;; Commentary:
;;; Code:

(use-package paren
  :custom
  (show-paren-delay 0)
  (show-paren-mode 1))

;; (use-package elec-pair
;;   :config
;;   (electric-pair-mode))

;;; Commenting
;; (icostan/leader-keys
;;   ";" '(comment-line :wk "comment lines"))
;; (icostan/leader-keys
;;   ";" '(comment-or-uncomment-region :wk "comment region"))

(use-package lorem-ipsum)

;; Wakatime
(use-package wakatime-mode
  :ensure-system-package (wakatime)
  :init
  (setq wakatime-api-key "978b706c-dcd2-4d83-955b-25ed115813b9")
  ;; (setq wakatime-api-key (getenv "WAKATIME_KEY"))
  :config
  (global-wakatime-mode))

(use-package spelling :load-path "init")
(use-package help :load-path "init")
(use-package searching :load-path "init")

(use-package highlight-indent-guides
  :defer t
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom (highlight-indent-guides-method 'bitmap))

(use-package highlight-numbers
  :hook (prog-mode . highlight-numbers-mode))

(use-package highlight-escape-sequences
  :hook (prog-mode . hes-mode))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))
(use-package highlight-parentheses
  :hook
  (prog-mode . highlight-parentheses-mode))

;; (use-package highlight-symbol
;;   :hook (prog-mode . highlight-symbol-mode)
;;   :custom
;;   (highlight-symbol-idle-delay 0.3))

(use-package idle-highlight-mode
  :custom
  (idle-highlight-idle-time 1)
  ;; :hook
  ;; ((prog-mode text-mode) . idle-highlight-mode)
  :config
  (global-idle-highlight-mode))

(use-package redacted)

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'after-init-hook 'org-agenda-list)

(use-package sideline
  :custom
  ;; sideline-backends-left '(sideline-flymake)
  sideline-backends-right '((sideline-flycheck . down)
                            (sideline-flymake . up))
  sideline-display-backend-name t
  :hook
  (flycheck-mode . sideline-mode)
  (flymake-mode  . sideline-mode))

(use-package xref
  :config
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read))

(use-package xref-union)

(use-package nerd-icons-xref
  :init
  (nerd-icons-xref-mode))

(use-package multiple-cursors)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(provide 'editing)

;;; editing.el ends here
