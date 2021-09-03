;;; git.el --- Git
;;; Commentary:
;;; Code:

(use-package magit
  :config
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))
(use-package forge
  :after magit)
(use-package gitattributes-mode)
(use-package gitconfig-mode)
(use-package gitignore-mode)
(use-package posframe)

(message "==> DONE: git.el")

(provide 'git)

;;; git.el ends here
