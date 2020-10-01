;;; solidity.el --- Solidity
;;; Commentary:
;;; Code:

(use-package solidity-mode
  :mode "\\.sol\\'")

(use-package solidity-flycheck
  :after (flycheck solidity-mode)
  :custom
  (solidity-flycheck-solc-checker-active t))

(provide 'solidity)

;;; solidity.el ends here
