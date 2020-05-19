;;; emacs-lisp.el --- Emacs Lisp

;;; Commentary:
;;

;;; Code:

;; (use-package lisp
;;   :hook
;;   (after-save . check-parens))

(use-package package-lint)
(use-package flycheck-package
  :after (flycheck package-lint)
  :config
  (flycheck-package-setup))

(use-package cov
  :config
  (setq gcov-coverage-file-paths '("." "../coverage/lcov" "../../coverage/lcov")
	gcov-coverage-alist '((".lcov" . lcov))))

(provide 'emacs-lisp)

;;; emacs-lisp.el ends here
