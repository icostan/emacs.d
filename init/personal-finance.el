;;; personal-finance.el --- Personal finance with Ledger
;;; Commentary:
;;; Code:

(use-package ledger-mode
  :custom
  (ledger-post-amount-alignment-column 62)
  (ledger-accounts-file "accounts.ledger")
  :general
  (general-nmap
    :keymaps 'ledger-mode-map
    :major-modes t
    "z f" '(ledger-mode-clean-buffer :wk "format Ledger"))
  (icostan/leader-keys
    "l"   '(:ignore t :wk "ledger")
    "ll"  '(ledger-add-transaction :wk "add transaction")
    "lr"  '(ledger-report :wk "report")
    "lf"  '(ledger-mode-clean-buffer :wk "format")))

(use-package flycheck-ledger
  :after ledger-mode)

(use-package evil-ledger
  :after (evil ledger-mode)
  :custom
  (evil-ledger-sort-key "S")
  :config
  (add-hook 'ledger-mode-hook #'evil-ledger-mode))

(message "==> INIT: personal-finance.el")

(provide 'personal-finance)

;;; personal-finance.el ends here
