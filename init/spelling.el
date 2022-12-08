;;; spelling.el --- Spelling and checking
;;; Commentary:
;;; Code:

(use-package flyspell
  :config
  (flyspell-prog-mode)
  :general
  (icostan/leader-keys
    "S"    '(nil :wk "spelling")
    "Sb"   '(flyspell-buffer :wk "flyspell buffer")
    "St"   '(flyspell-mode :wk "flyspell toggle")))

(use-package flyspell-correct
  :general
  (icostan/leader-keys
    "Sc"   '(flyspell-correct-wrapper :wk "flyspell-correct")
    "Sw"   '(flyspell-correct-at-point :wk "flyspell-correct word")))

(use-package flycheck-aspell
  :after flycheck
  :config
  (add-to-list 'flycheck-checkers 'tex-aspell-dynamic))

(use-package writegood-mode
  :general
  (icostan/leader-keys
    "Sg"   '(writegood-grade-level :wk "writegood grade")
    "Se"   '(writegood-reading-ease :wk "writegood ease")))

(use-package synosaurus
  :ensure-system-package (wn . wordnet-cli)
  ;; :custom
  ;; (synosaurus-choose-method 'default)
  :config
  (synosaurus-mode)
  :general
  (icostan/leader-keys
    "Sr"   '(synosaurus-lookup :wk "synonyms lookup")))

;; (use-package xah-lookup
;;   :init
;;   (setq xah-lookup-browser-function 'eww))

(use-package consult-flyspell
  :quelpa (:fetcher github :repo "OlMon/consult-flyspell")
  :custom
  (consult-flyspell-select-function 'flyspell-correct-at-point
   consult-flyspell-set-point-after-word t
   consult-flyspell-always-check-buffer t)
  :general
  (icostan/leader-keys
    "SS" '(consult-flyspell :wk "consult-correct")))

(message "==> INIT: spelling.el")

(provide 'spelling)

;;; spelling.el ends here
