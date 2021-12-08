;;; misc.el --- Misc packages
;;; Commentary:
;;; Code:


;; TODO make it declarative
;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Minimal UI in terminal as well
;; (if (fboundp 'scroll-bar-mode)
;;     (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode)
;;     (tool-bar-mode -1))

(message "==> INIT: misc.el")

(provide 'misc)

;;; misc.el ends here
