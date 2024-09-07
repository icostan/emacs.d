;;; math.el --- math

;;; Commentary:
;;

;;; Code:

(use-package calc
  :defer t)

(use-package casual-calc
  ;; :ensure nil
  :bind (:map
         calc-mode-map
         ("C-o" . casual-calc-tmenu)
         ;; :map
         ;; calc-alg-map
         ;; ("C-o" . casual-calc-tmenu)
         )
  :after (calc))

(message "==> INIT: math.el")

(provide 'math)

;;; math.el ends here
