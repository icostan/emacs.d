;;; project-management.el --- Project management with Projectile
;;; Commentary:
;;; Code:

(use-package projectile
  :custom
  (projectile-complection-system 'auto)
  :config
  (projectile-mode 1)
  :general
  (icostan/leader-keys
    :states '(normal visual motion)
    :keymaps 'override
    "p"   '(nil :wk "projects")
    "pp"  '(consult-projectile :wk "default (to project/file/buffer)")
    ;; "pp"  '(projectile-switch-project :wk "switch project")
    "pf"  '(projectile-find-file :wk "find files")
    "pF"  '(projectile-find-file-other-window :wk "find files other window")
    "po"  '(projectile-find-other-file :wk "find extension")
    "pt"  '(vanilla-projectile-goto-todos :wk "todos")
    "pb"  '(projectile-switch-to-buffer :wk "switch buffer")
    "pB"  '(projectile-switch-to-buffer-other-window :wk "switch buffer other window")
    "pr"  '(project-dired :wk "root")))

(use-package helm-projectile
  :if (vanilla-helm-mode-p)
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
