;;; math.el --- math

;;; Commentary:
;;

;;; Code:

(use-package calc
  :defer t
  :bind (:map
         calc-mode-map
         ("C-o" . casual-calc-tmenu)))

(message "==> INIT: math.el")

(provide 'math)

;;; math.el ends here
