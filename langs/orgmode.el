;;; orgmode.el --- Org Mode
;;; Commentary:
;;; Code:

(defun icostan/capture_template (name)
  "Return template file for NAME."
  `(file concat("templates/" name)))

(use-package org
  ;; :ensure org-plus-contrib
  :init
  (setq image-file-name-regexps (list (regexp-quote "svg"))
        org-todo-keyword-faces '(("N/A" . "gray") ("CANCELED" . "gray") ("DONE" . "green") ("FAIL" . "gray") ("WIP" . "red"))
        org-confirm-babel-evaluate nil
        org-export-use-babel nil
        org-agenda-files (directory-files-recursively "~/Projects" "TODOs\\.org")
        ;; org-agenda-files ()
        org-agenda-window-setup 'other-window
        org-agenda-restore-windows-after-quit t)
  :custom
        org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar"
  :config
  (setq org-default-notes-file (concat org-directory "/notes.org")
        org-capture-templates
        '(("e" "emacs.d" entry (file+headline "~/Projects/emacs.d/TODOs.org" "Tasks") (file "templates/emacs.d-todo.org"))
          ("a" "arch.d" entry (file+headline "~/Projects/arch.d/TODOs.org" "Tasks") (file "templates/arch.d-todo.org"))
          ("o" "org.d" checkitem (file+datetree "~/Projects/org.d/journal/20200601") (file "templates/org.d-todo.org"))))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ditaa . t)
     (emacs-lisp . t)
     (js . t)
     (haskell . t)
     (ledger . t)
     (latex . t)
     (python . t)
     (ruby . t)
     (rust . t)
     (sagemath . t)
     (shell . t)
     (sql . nil))))
(use-package ob-rust)

(use-package org-journal
  :after org
  :init
  (setq org-journal-dir "~/Projects/org.d/journal"
        org-journal-file-type 'monthly
        org-read-date-popup-calendar nil)
  :config
  (setq org-journal-date-format "%A, %x"
        org-journal-time-format ""
        org-journal-time-prefix "  - [ ] "))

(use-package org-tanglesync
  :diminish "OTS"
  :after org
  :hook
  ((org-mode . org-tanglesync-mode)
   (text-mode . org-tanglesync-watch-mode)
   (prog-mode . org-tanglesync-watch-mode))
  :custom
  (org-tanglesync-watch-files '("README.org"))
  (org-tanglesync-default-diff-action :external)
  :config
  (org-tanglesync-watch-mode 1))

(use-package org-preview-html
  :after org)

;; (use-package evil-org
;;   :after (org evil)
;;   :config
;;   (add-hook 'org-mode-hook 'evil-org-mode)
;;   (add-hook 'evil-org-mode-hook
;;             (lambda ()
;;               (evil-org-set-key-theme)))
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys))
(use-package org-evil
  :after org
  :config
  (org-evil-mode))

(provide 'orgmode)

;;; orgmode.el ends here
