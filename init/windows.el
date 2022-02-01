;;; windows.el --- Windows essentials
;;; Commentary:
;;; Code:


(use-package golden-ratio
  :config
  (golden-ratio-mode t))
(use-package ace-window)

(use-package winum
  :init
  (winum-mode 1))

;; TODO: try evil-window: "C-w"
;; TODO: try https://github.com/auto-complete/popup-el
(message "==> INIT: windows.el")

(provide 'windows)

;;; windows.el ends here
