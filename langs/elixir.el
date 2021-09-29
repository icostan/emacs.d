;;; elixir.el --- Elixir
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :mode "\\.ex\\'")
(use-package alchemist
  :after elixir-mode
  :general
  (general-nmap
    ", t" '(alchemist-mix-test-this-buffer :wk "alchemist test buffer")
    ", s" '(alchemist-mix-test-at-point :wk "alchemist test single")
    "g b" '(alchemist-goto-jump-back :wk "alchemist go back")))

(provide 'elixir)

;;; elixir.el ends here
