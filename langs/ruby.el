;;; ruby.el --- https://www.ruby-lang.org/en/

;;; Commentary:
;;
;;; Code:

(use-package ruby-mode
  :general
  (general-nmap ", s" '(minitest-verify-single :wk "test single")
		", a" '(minitest-verify-all :wk "test all"))
  :mode "\\.rb\\'"
  :interpreter "ruby")
(use-package rspec-mode
  :after ruby-mode
  :config (rspec-install-snippets))
(use-package minitest
  :after ruby-mode
  :config (minitest-install-snippets))
(use-package bundler
  :after ruby-mode)
(use-package rbenv
  :after ruby-mode
  :config (global-rbenv-mode))

(provide 'ruby)

;;; ruby.el ends here
