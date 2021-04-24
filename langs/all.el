;;; all.el --- All langs
;;; Commentary:
;;; Code:

;; (use-package format-all
;;   :ensure-system-package (prettier)
;;   :ensure-system-package (tidy)
;;   :ensure-system-package (black . "pip install black")
;;   :ensure-system-package (rufo . "gem install rufo"))

(general-nmap ", t"
  (general-predicate-dispatch nil
    (equal major-mode 'rustic-mode) 'rustic-cargo-test
    (equal major-mode 'ruby-mode) 'rspec-verify-single))

(general-nmap
  ", t" '(nil :wk "test prefix"))

(provide 'all)

;;; all.el ends here
