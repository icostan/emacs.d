;;; selection-ivy.el --- Selection and narrowing with Ivy
;;; Commentary:
;;; Code:

(use-package ivy
  ;; :custom
  ;; (ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  ;; (ivy-count-format "%d/%d " "Show anzu-like counter")
  ;; (ivy-use-selectable-prompt t "Make the prompt line selectable")
  ;; :custom-face
  ;; (ivy-current-match ((t (:inherit 'hl-line))))
  :config
  (ivy-mode t))

;; (use-package ivy-postframe
;;   :config
;;   (ivy-postframe-mode))

;;; TODO: try https://github.com/asok/all-the-icons-ivy

(message "==> INIT: selection-ivy.el")

(provide 'selection-ivy)

;;; selection-ivy.el ends here
