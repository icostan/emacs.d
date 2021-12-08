;;; project-management.el --- Project management with Projectile
;;; Commentary:
;;; Code:

(use-package projectile
  :config
  (projectile-mode 1))
(use-package org-projectile
  :init
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "TODOs.org")
  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  (push (org-projectile-project-todo-entry) org-capture-templates))
(use-package helm-projectile
  :config
  (helm-projectile-on))

(message "==> INIT: project-management.el")

(provide 'project-management)

;;; project-management.el ends here
