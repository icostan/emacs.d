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
    ", t" '(alchemist-mix-test-this-buffer :wk "test Elixir")
    ", s" '(alchemist-mix-test-at-point :wk "single Elixir")
    "g b" '(alchemist-goto-jump-back :wk "go back Elixir")))

;; (use-package flymake-elixir)

(provide 'elixir)

;;; elixir.el ends here
