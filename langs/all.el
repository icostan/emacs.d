;;; all.el --- All langs
;;; Commentary:
;;; Code:

;; (use-package format-all
;;   :ensure-system-package (prettier)
;;   :ensure-system-package (tidy)
;;   :ensure-system-package (black . "pip install black")
;;   :ensure-system-package (rufo . "gem install rufo"))

;; (general-nmap ", t"
;;   (general-predicate-dispatch nil
;;     (equal major-mode 'rustic-mode) 'rustic-cargo-test
;;     (equal major-mode 'ruby-mode) 'rspec-verify-single))

(general-nmap
  ;; "z f" '(nil :wk "format LANG")
  ;; ", s" '(nil :wk "test single LANG")
  ;; ", t" '(nil :wk "test buffer LANG")
  ;; "g d" '(nil :wk "go definition LANG")
  "g b" '(evil-jump-backward :wk "go back"))

(provide 'all)

;;; all.el ends here
