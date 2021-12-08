;;; personal-finance.el --- Personal finance with Ledger
;;; Commentary:
;;; Code:

(use-package ledger-mode
  :config
  (setq ledger-post-amount-alignment-column 62)
  (setq ledger-accounts-file "accounts.ledger"))
(use-package flycheck-ledger
  :after ledger-mode)
(use-package evil-ledger
  :after (evil ledger-mode)
  :config
  (setq evil-ledger-sort-key "S")
  (add-hook 'ledger-mode-hook #'evil-ledger-mode))

(message "==> INIT: personal-finance.el")

(provide 'personal-finance)

;;; personal-finance.el ends here
