;;; shell.el --- Shell
;;; Commentary:
;;; Code:

(use-package sh-script)
  ;; :mode "\\.exports\\'")

(defvaralias 'shell-mode-hook 'sh-mode-hook)

(use-package flymake-bashate
  :ensure t
  :commands flymake-bashate-setup
  :hook (((bash-ts-mode sh-mode) . flymake-bashate-setup)
         ((bash-ts-mode sh-mode) . flymake-mode))
  :custom
  (flymake-bashate-max-line-length 80))

(provide 'shell)

;;; shell.el ends here
