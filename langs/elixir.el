;;; elixir.el --- Elixir
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :mode "\\.ex\\'")

(use-package alchemist
  :after elixir-mode
  :general
  (general-nmap
    :keymaps 'elixir-mode-map
    :major-modes t
    "z f" '(elixir-format :wk "format Elixir")
    ", q" '(alchemist-test-toggle-test-report-display :wk "quit test")
    ", t" '(alchemist-mix-test-this-buffer :wk "test Elixir")
    ", s" '(alchemist-mix-test-at-point :wk "single Elixir")
    ", o" '(alchemist-project-toggle-file-and-tests-other-window :wk "other Test")
    "g b" '(alchemist-goto-jump-back :wk "go back Elixir")))

(use-package ob-elixir)

;; (use-package flymake-elixir)

(provide 'elixir)

;;; elixir.el ends here
