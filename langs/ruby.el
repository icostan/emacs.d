;;; ruby.el --- Ruby
;;; Commentary:
;;; Code:

(use-package ruby-mode
  :ensure-system-package
  ((rubocop     . "ruby-rubocop")
   (ruby-lint   . "ruby-lint")
   (pry         . "ruby-pry"))
  :general
  (general-nmap
    ;; :predicate '(eq major-mode 'ruby-mode)
    :major-modes t
    ", s" '(minitest-verify-single :wk "test Ruby single")
    ", t" '(minitest-verify-all :wk "test Ruby all"))
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby")
(use-package rspec-mode
  :after ruby-mode
  :config (rspec-install-snippets))
(use-package minitest
  :after ruby-mode
  :config (minitest-install-snippets))
(use-package ruby-test-mode
  :after ruby-mode)
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
