;;; themes.el --- Themes
;;; Commentary:
;;; Code:

;; (use-package monokai-theme
;;   :custom
;;   (monokai-foreground     "#F8F8FF")
;;   (monokai-comments       "#75715E")
;;   :config
;;   (load-theme 'monokai t))
;; (use-package ayu-theme
;;   :config (load-theme 'ayu-grey t))

(use-package darkokai-theme
  :custom (darkokai-mode-line-padding 1)
  :config (load-theme 'darkokai t))

(message "==> INIT: themes.el")

(provide 'themes)

;;; themes.el ends here
