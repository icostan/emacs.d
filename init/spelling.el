;;; spelling.el --- Spelling and checking
;;; Commentary:
;;; Code:

(use-package flyspell
  :config
  (flyspell-mode))
(use-package flyspell-correct)
(use-package flycheck-aspell
  :after flycheck
  :config
  (add-to-list 'flycheck-checkers 'tex-aspell-dynamic))
(use-package writegood-mode)
(use-package synosaurus
  :ensure-system-package (wn . wordnet-cli)
  ;; :custom
  ;; (synosaurus-choose-method 'default)
  :config
  (synosaurus-mode))
;; (use-package xah-lookup
;;   :init
;;   (setq xah-lookup-browser-function 'eww))

(message "==> INIT: spelling.el")

(provide 'spelling)

;;; spelling.el ends here
