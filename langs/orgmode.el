;;; orgmode.el --- Org Mode
;;; Commentary:
;;; Code:

(defun icostan/capture_template (name)
  "Return template file for NAME."
  `(file concat("templates/" name)))

(use-package org
  :ensure org-plus-contrib
  :init
  (setq image-file-name-regexps (list (regexp-quote "svg"))
        org-todo-keyword-faces '(("N/A" . "gray") ("CANCELED" . "gray") ("DONE" . "green") ("FAIL" . "red"))
        org-confirm-babel-evaluate nil
        org-agenda-files (directory-files-recursively "~/Projects" "TODOs\\.org")
        ;; org-agenda-files `()
        org-agenda-window-setup 'other-window
        org-agenda-restore-windows-after-quit t)
  :config
  (setq org-default-notes-file (concat org-directory "/notes.org")
        org-capture-templates
        '(("e" "emacs.d" entry (file+headline "~/Projects/emacs.d/TODOs.org" "Tasks") (file "templates/emacs.d-todo.org"))
          ("a" "arch.d" entry (file+headline "~/Projects/arch.d/TODOs.org" "Tasks") (file "templates/arch.d-todo.org"))
          ("o" "org.d" checkitem (file+datetree "~/Projects/org.d/journal/20200601") (file "templates/org.d-todo.org"))))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (haskell . t)
     (ledger . t)
     (python . t)
     (ruby . t)
     (shell . t)
     (sql . nil))))

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
  :hook ((org-mode . org-tanglesync-mode)
         ((prog-mode text-mode) . org-tanglesync-watch-mode))
  ;; :custom
  ;; (org-tanglesync-watch-files '("~/Projects/emacs.d/langs/README.org"))
  ;; (org-tanglesync-default-diff-action :external)
  ;; (org-tanglesync-watch-mode 1)
  :config
  (setq org-tanglesync-watch-files '("README.org")
        org-tanglesync-watch-mode 1
        org-tanglesync-default-diff-action :external))

(use-package org-preview-html)

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
  :config
  (org-evil-mode))


(provide 'orgmode)

;;; orgmode.el ends here
