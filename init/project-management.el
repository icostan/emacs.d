;;; project-management.el --- Project management with style
;;; Commentary:
;;; Code:

(use-package project
  :general
  (icostan/leader-keys
    "p"   '(nil :wk "projects")
    "ps"  '(project-eshell :wk "shell")
    "pf"  '(project-find-file :wk "file")
    "pr"  '(project-dired :wk "root")))

(use-package consult-project-extra
  :general
  (icostan/leader-keys
    "pp"  '(consult-project-buffer :wk "default (buffers)")
    "pb"  '(consult-project-buffer :wk "buffers")
    "pa"  '(consult-project-extra-find :wk "find all")
    "pA"  '(consult-project-extra-find-other-window :wk "find all (other)")))

(use-package projectile
  :custom
  (projectile-complection-system 'auto)
  :config
  (projectile-mode 1)
  :general
  (icostan/leader-keys
    "pt" '(vanilla-projectile-goto-todos :wk "todos")
    "ps" '(projectile-switch-project :wk "projects")
    "pe" '(projectile-find-other-file :wk "find extension")))

(use-package consult-projectile
  :after (consult projectile)
  :general
  (icostan/leader-keys
    "pB" '(consult-projectile-switch-to-buffer-other-window :wk "buffers (other)")
    "pF" '(consult-projectile-find-file-other-window :wk "file (other)")))

(use-package org-projectile
  :custom
  (org-project-capture-per-project-filepath "TODOs.org")
  :config
  (org-projectile-per-project)
  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  (push (org-projectile-project-todo-entry) org-capture-templates))

(message "==> INIT: project-management.el")

(provide 'project-management)

;;; project-management.el ends here
