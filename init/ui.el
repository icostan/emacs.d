;;; ui.el --- Look and feel, UI things
;;; Commentary:
;;; Code:

(use-package posframe)

;;; only GUI
(use-package all-the-icons
  :if (display-graphic-p))

;;; works in gui and terminal as well, needs a nerd-font installed
(use-package nerd-icons)

(message "==> INIT: ui.el")

(provide 'ui)

;;; ui.el ends here
