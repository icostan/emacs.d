;;; elixir.el --- Elixir
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :ensure-system-package (elixir-ls . elixir-ls)
  :mode "\\.ex\\'")

(use-package alchemist
  :after elixir-mode
  :general
  (general-nmap
    ;; :predicate '(eq major-mode 'elixir-mode)
    :major-modes t
    "z f" '(elixir-format :wk "format Elixir buffer")
    ", t" '(alchemist-mix-test-this-buffer :wk "alchemist test buffer")
    ", s" '(alchemist-mix-test-at-point :wk "alchemist test single")
    "g b" '(alchemist-goto-jump-back :wk "alchemist go back")))

(provide 'elixir)

;;; elixir.el ends here
