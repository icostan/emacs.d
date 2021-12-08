;;; editing.el --- Editing essentials
;;; Commentary:
;;; Code:

(use-package paren
  :custom
  (show-paren-delay 0)
  (show-paren-mode 1))

(use-package elec-pair
  :config
  (electric-pair-mode))

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


;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'after-init-hook 'org-agenda-list)

(provide 'editing)

;;; editing.el ends here
