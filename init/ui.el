;;; ui.el --- Look and feel, UI things
;;; Commentary:
;;; Code:

(use-package posframe)

;;; only GUI
(use-package all-the-icons
  :if (display-graphic-p))

;;; works in gui and terminal as well, needs a nerd-font installed
(use-package nerd-icons
  ;; :ensure-system-package (ttf-nerd-fonts-symbols-mono)
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

(message "==> INIT: ui.el")

(provide 'ui)

;;; ui.el ends here
