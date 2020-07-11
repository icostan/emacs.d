;;; rust.el --- Rust
;;; Commentary:
;;; Code:

(use-package rustic
  :general
  (general-nmap
        ;; :predicate (derived-mode-p 'rustic-mode)
        ", t" '(rustic-cargo-test :wk "test rust"))
  :custom
  (rustic-format-trigger 'on-save))

(provide 'rust)

;;; rust.el ends here
