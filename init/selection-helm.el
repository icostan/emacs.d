;;; selection-helm.el --- Selection and narrowing with Helm
;;; Commentary:
;;; Code:

(defvar helm-posframe-buffer nil)

(defun helm-postframe-display (buffer &optional _resume)
  "Helm display function to show BUFFER."
  (posframe-show
   (setq helm-posframe-buffer buffer)
   :poshandler #'posframe-poshandler-frame-center
   :left-fringe 10
   :width 100
   :height 30
   :background-color "#263146" ;;"#464f60"
   :respect-header-line t))
(defun helm-posframe-cleanup ()
  "Helm cleanup function."
  (posframe-hide helm-posframe-buffer))

(add-hook 'helm-cleanup-hook #'helm-posframe-cleanup)

(use-package helm
  :init
  (setq helm-display-function 'helm-postframe-display
        helm-M-x-fuzzy-match t
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
  :after helm
  :init
  (setq helm-swoop-pre-input-function
        (lambda ()
          (if mark-active
              (buffer-substring-no-properties (mark) (point))
            ""))))

(use-package helm-ag
  :after helm)

(use-package helm-icons
  :config
  (helm-icons-enable))

(message "==> INIT: selection-helm.el")

(provide 'selection-helm)

;;; selection-helm.el ends here
