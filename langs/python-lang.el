;;; python-lang.el --- Python-Lang
;;; Commentary:
;;; Code:

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(provide 'python-lang)

;;; python-lang.el ends here
