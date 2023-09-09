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
    "z f" '(elixir-format :wk "format (Elixir)")
    ", q" '(alchemist-test-toggle-test-report-display :wk "quit test (Elixir)")
    ", t" '(alchemist-mix-test-this-buffer :wk "run test (Elixir)")
    ", s" '(alchemist-mix-test-at-point :wk "run single (Elixir)")
    ", r" '(alchemist-mix-rerun-last-test :wk "rerun test (Elixir)")
    ", o" '(alchemist-project-toggle-file-and-tests-other-window :wk "other (Elixir)")
    "g b" '(alchemist-goto-jump-back :wk "go back (Elixir)")))

(use-package ob-elixir)

;; (use-package flymake-elixir)

(provide 'elixir)

;;; elixir.el ends here
