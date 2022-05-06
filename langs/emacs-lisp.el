;;; emacs-lisp.el --- Emacs Lisp
;;; Commentary:
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

;; https://github.com/abo-abo/lispy
(use-package lispy)

;; http://danmidwood.com/content/2014/11/21/animated-paredit.html
(use-package paredit)

;; https://ebzzry.com/en/emacs-pairs/
(use-package smartparens
  :general
  (general-nmap
    ", n" 'sp-forward-sexp
    ", p" 'sp-backward-sexp
    ", s" 'sp-cheat-sheet))

(provide 'emacs-lisp)

;;; emacs-lisp.el ends here
