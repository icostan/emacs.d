;;; elixir.el --- Elixir
;;; Commentary:
;;; Code:

(use-package alchemist
  ;; :mode "\\.ex\\'"
  :general
  (general-nmap
    ", t" '(alchemist-mix-test-this-buffer :wk "alchemist test buffer")
    ", s" '(alchemist-mix-test-at-point :wk "alchemist test single")
    "g b" '(alchemist-goto-jump-back :wk "alchemist go back")))

(provide 'elixir)

;;; elixir.el ends here
