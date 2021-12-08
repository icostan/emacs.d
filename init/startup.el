;;; startup.el --- Startup screen
;;; Commentary:
;;; Code:

(use-package dashboard
  :config
  (setq dashboard-items '((agenda . 10)
                          (projects . 10))
        dashboard-center-content t
        show-week-agenda t
        dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

(provide 'startup)

;;; startup.el ends here
