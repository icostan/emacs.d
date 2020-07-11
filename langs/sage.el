;;; sage.el --- Sage
;;; Commentary:
;;; Code:

(use-package sage-shell-mode
  :config
  (sage-shell:define-alias))
(use-package ob-sagemath
  :after sage-shell-mode
  :custom
 (org-babel-default-header-args:sage '((:session . t)
                                       (:results . "output"))))
(use-package helm-sage
  :after (helm sage-shell-mode)
  :general
  ;; TODO: create a definer
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   :keymaps 'override
   "m" '(nil :wk "math")
   "mc" '(helm-sage-complete :wk "completion")))

(provide 'sage)

;;; sage.el ends here
