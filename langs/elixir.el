;;; elixir.el --- Elixir -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package elixir-mode
  :mode "\\.ex\\'"
  :hook
  ;; Disable SMIE sexp navigation. Upstream elixir-mode's SMIE tokenizer has a bug where
  ;; '#' inside strings/heredocs causes forward-comment to not advance, emitting ";"
  ;; at the same position in an infinite 100% CPU loop during eldoc/eglot/motion checks.
  ;; Setting forward-sexp-function to nil restores Emacs's fast C sexp parser while
  ;; leaving indentation intact.
  (elixir-mode . (lambda () (setq-local forward-sexp-function nil))))

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
