;;; rust.el --- Rust
;;; Commentary:
;;; Code:

(use-package rustic
  :general
  (general-nmap
    ;; :predicate '(eq major-mode 'rustic-mode)
    :major-modes t
    ", t" '(rustic-cargo-test :wk "test Rust"))
  :custom
  (rustic-format-trigger 'on-save))

(provide 'rust)

;;; rust.el ends here
