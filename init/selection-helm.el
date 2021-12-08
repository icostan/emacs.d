;;; selection-helm.el --- Selection and narrowing with Helm
;;; Commentary:
;;; Code:

(use-package helm
  :init
  (setq helm-M-x-fuzzy-match t
        helm-completion-style :helm-fuzzy
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-locate-fuzzy-match t
        helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-candidate-number-list 150
        helm-split-window-inside-p t
        helm-move-to-line-cycle-in-source t
        helm-echo-input-in-header-line t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

(use-package helm-swoop
  ;; :general
  ;; (general-nmap "g /" '(helm-swoop :wk "search"))
  :after helm
  :init
  (setq helm-swoop-pre-input-function
        (lambda ()
          (if mark-active
              (buffer-substring-no-properties (mark) (point))
            ""))))

(use-package helm-ag
  :after helm)

(message "==> INIT: selection-helm.el")

(provide 'selection-helm)

;;; selection-helm.el ends here
