;;; project-management.el --- Project management with style
;;; Commentary:
;;; Code:

;; default project.el
(use-package project
  :general
  (icostan/leader-keys
    :states 'normal
    "p"   '(nil :wk "projects")
    "pr"  '(project-dired :wk "root")))

(use-package consult-project-extra
  :general
  (icostan/leader-keys
    :states '(normal motion)
    :keymaps 'override
    "pp"  '(consult-project-extra-find :wk "find (default)")
    "pP"  '(consult-project-extra-find-other-window :wk "find other")))

;; with Projectile extension
(use-package projectile
  :custom
  (projectile-complection-system 'auto)
  :config
  (projectile-mode 1)
  :general
  (icostan/leader-keys
    :states 'normal
    ;; "pp"  '(consult-projectile :wk "default (to project/file/buffer)")
    ;; "pf"  '(projectile-find-file :wk "find files")
    ;; "pF"  '(projectile-find-file-other-window :wk "find files other window")
    ;; "pb"  '(projectile-switch-to-buffer :wk "switch buffer")
    "pt"  '(vanilla-projectile-goto-todos :wk "todos")
    ;; "pB"  '(projectile-switch-to-buffer-other-window :wk "switch buffer other window"))
    "pe"  '(projectile-find-other-file :wk "find extension")))

(use-package consult-projectile
  :after (consult projectile)
  :quelpa (:fetcher gitlab :repo "OlMon/consult-projectile"))

(use-package helm-projectile
  :if (vanilla-helm-mode-p)
  :after (helm)
  :config
  (helm-projectile-on))

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
