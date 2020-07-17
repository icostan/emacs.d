;;; python-lang.el --- Python-Lang
;;; Commentary:
;;; Code:

(use-package python
  :ensure-system-package (pyls . python-language-server)
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))
(use-package pyenv-mode
  :ensure-system-package (pyenv)
  :config
  (pyenv-mode))

(provide 'python-lang)

;;; python-lang.el ends here
