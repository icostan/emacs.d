;;; project-management.el --- Project management with Projectile
;;; Commentary:
;;; Code:

(use-package projectile
  :custom
  (projectile-complection-system 'auto)
  :config
  (projectile-mode 1))

(use-package helm-projectile
  :config
  (helm-projectile-on))
;; (use-package counsel-projectile
;;   :config
;;   (counsel-projectile-mode))

(use-package org-projectile
  :custom
  (org-projectile-per-project-filepath "TODOs.org")
  :config
  (org-projectile-per-project)
  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  (push (org-projectile-project-todo-entry) org-capture-templates))

(message "==> INIT: project-management.el")

(provide 'project-management)

;;; project-management.el ends here
