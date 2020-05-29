;;; ruby.el --- Ruby
;;; Commentary:
;;; Code:

(use-package ruby-mode
  :ensure-system-package
  ((rubocop     . "gem install rubocop")
   (ruby-lint   . "gem install ruby-lint")
   (pry         . "gem install pry"))
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
(use-package feature-mode
  :custom
  (feature-use-docker-compose nil))

(provide 'ruby)

;;; ruby.el ends here
