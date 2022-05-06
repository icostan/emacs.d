;;; navigation.el --- Buffer navigation
;;; Commentary:
;;; Code:

(use-package ace-jump-mode
  :general
  (general-nmap "g l" '(ace-jump-line-mode :wk "to line")
    "g w" '(ace-jump-word-mode :wk "to word")
    "g W" '(evil-fill :wk "evil-fill (unbound w)")))
;; (use-package ace-jump-mode
;;   :chords (("gc" . ace-jump-char-mode)
;;            ("gw" . ace-jump-word-mode)
;;            ("gl" . ace-jump-line-mode)))

;; https://karthinks.com/software/avy-can-do-anything/
;; (use-package avy
;;   :bind (("C-c j l" . avy-goto-line)
;;          ("C-c j a" . avy-goto-char-timer))

(message "==> INIT: navigation.el")

(provide 'navigation)

;;; navigation.el ends here
