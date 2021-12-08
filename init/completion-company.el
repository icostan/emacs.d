;;; completion-company.el --- Completion with company
;;; Commentary:
;;; Code:

(use-package company
  :defer t
  :diminish company-mode
  :init (global-company-mode))
(use-package company-quickhelp
  :after company
  :init
  (company-quickhelp-mode))

(message "==> INIT: completion-company.el")

(provide 'completion-company)

;;; completion-company.el ends here
