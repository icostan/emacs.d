;;; completion-style-orderless.el --- Completion with Orderless
;;; Commentary:
;;; Code:

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles . (partial-completion)))))
  (completion-category-defaults nil))

(provide 'completion-style-orderless)

;;; completion-style-orderless.el ends here
