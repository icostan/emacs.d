;;; orgmode.el --- Org Mode
;;; Commentary:
;;; Code:

(defun icostan/capture_template (name)
  "Return template file for NAME."
  `(file concat("templates/" name)))

(use-package org
  ;; :ensure org-plus-contrib
  :general
  (icostan/leader-keys
    :keymaps 'org-mode-map
    "j h" '(consult-org-heading :wk "to heading"))
  :init
  (setq org-todo-keyword-faces '(("N/A" . "gray") ("CANCELED" . "gray") ("DONE" . "green") ("FAIL" . "gray") ("WIP" . "red"))
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
   '((calc . t)
     (ditaa . t)
     (dot . t)
     (elixir . t)
     (emacs-lisp . t)
     (js . t)
     (haskell . t)
     (latex . t)
     (ledger . t)
     (mermaid . t)
     (python . t)
     (ruby . t)
     (rust . t)
     (sagemath . t)
     (shell . t)
     (sql . nil))))

(use-package org-journal
  :after org
  :init
  (setq org-journal-dir "~/Projects/org.d/journal"
        org-journal-file-type 'yearly
        org-journal-file-format "%Y"
        org-read-date-popup-calendar nil)
  :config
  (setq org-journal-date-format "%A, %x"
        org-journal-date-prefix "* "
        org-journal-time-format ""
        org-journal-time-prefix "- [ ] "))

;; (use-package org-tanglesync
;;   :diminish "OTS"
;;   :after org
;;   :hook
;;   ((org-mode . org-tanglesync-mode)
;;    (text-mode . org-tanglesync-watch-mode)
;;    (prog-mode . org-tanglesync-watch-mode))
;;   :custom
;;   (org-tanglesync-watch-files '("README.org"))
;;   (org-tanglesync-default-diff-action :external)
;;   :config
;;   (org-tanglesync-watch-mode 1))

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

(use-package calendar
  :config
  (setq calendar-week-start-day 1)
  :general
  (general-nmap
    :keymaps 'calendar-mode-map
    :major-modes t
    "C-o" '(casual-calendar :wk "casual calendar")))

(use-package literate-calc-mode
  :ensure t)

;; TRY: org-ref

(provide 'orgmode)

;;; orgmode.el ends here
