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

(use-package helm-sage
  :if (vanilla-helm-mode-p)
  :after (helm sage-shell-mode)
  :general
  (icostan/leader-keys
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   :keymaps 'override
   "m" '(nil :wk "math")
   "mc" '(helm-sage-complete :wk "completion")))

(provide 'sage)

;;; sage.el ends here
