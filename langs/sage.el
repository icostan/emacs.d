;;; sage.el --- Sage
;;; Commentary:
;;; Code:

(use-package sage-shell-mode
  :mode "\\.sage\\'"
  :custom
  (sage-shell:use-prompt-toolkit nil)
  :config
  (sage-shell:define-alias))

(use-package ob-sagemath
  :custom
  (org-babel-default-header-args:sage '((:results . "output"))))

(provide 'sage)

;;; sage.el ends here
