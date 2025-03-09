;;; replacing.el --- Replacing

;;; Commentary:
;;

;;; Code:

(use-package visual-regexp-steroids
  :general
  (icostan/leader-keys
    "rg"   '(vr/replace :wk "regexp")
    "sg"   '(vr/query-replace :wk "regexp")))

(use-package visual-replace
  :general
  (icostan/leader-keys
    "rr"   '(visual-replace :wk "visual (default)")
    "rv"   '(visual-replace :wk "visual")
    "sv"   '(visual-replace :wk "visual")))

(provide 'replacing)

;;; replacing.el ends here
