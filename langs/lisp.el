;;; lisp.el --- Lisp

;;; Commentary:
;;

;;; Code:

(use-package package-lint)
(use-package flycheck-package
  :after (flycheck package-lint)
  :config
  (flycheck-package-setup))

(use-package cov
  :config
  (setq gcov-coverage-file-paths '("." "../coverage/lcov" "../../coverage/lcov")
	gcov-coverage-alist '((".lcov" . lcov))))

(provide 'lisp)

;;; lisp.el ends here
