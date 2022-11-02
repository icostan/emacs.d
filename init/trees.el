;;; trees.el --- Init trees
;;; Commentary:
;;; Code:

;; dired tree
(use-package all-the-icons-dired
  :after all-the-icons
  :custom (all-the-icons-dired-monochrome nil)
  :hook (dired-mode . all-the-icons-dired-mode))

;; dirvish
(use-package dirvish)

;; Tree
;; (use-package tree)

;; NeoTree
;; (use-package neotree
;;   :init
;;   (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; Treemacs
;; (use-package treemacs
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
;;           treemacs-directory-name-transformer    #'identity
;;           treemacs-file-event-delay              5000
;;           treemacs-file-extension-regex          treemacs-last-period-regex-value
;;           treemacs-file-follow-delay             0.2
;;           treemacs-file-name-transformer         #'identity
;;           treemacs-git-command-pipe              ""
;;           treemacs-goto-tag-strategy             'refetch-index
;;           treemacs-indentation                   2
;;           treemacs-indentation-string            " "
;;           treemacs-max-git-entries               5000
;;           treemacs-missing-project-action        'ask
;;           treemacs-no-png-images                 nil
;;           treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-position                      'left
;;           treemacs-recenter-distance             0.1
;;           treemacs-recenter-after-project-jump   'always
;;           treemacs-recenter-after-project-expand 'on-distance
;;           treemacs-sorting                       'alphabetic-asc
;;           treemacs-deferred-git-apply-delay      0.5
;;           treemacs-tag-follow-delay              1.5
;;           treemacs-width                         35)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode t)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null treemacs-python-executable)))
;;       (`(t . t)
;;        (treemacs-git-mode 'deferred))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))
;;   :bind
;;   (:map global-map
;;         ("M-0"       . treemacs-select-window)
;;         ("C-x t 1"   . treemacs-delete-other-windows)
;;         ("C-x t t"   . treemacs)
;;         ("C-x t B"   . treemacs-bookmark)
;;         ("C-x t C-t" . treemacs-find-file)
;;         ("C-x t M-t" . treemacs-find-tag)))
;; (use-package treemacs-evil
;;   :after treemacs evil)
;; (use-package treemacs-projectile
;;   :after treemacs projectile)
;; (use-package treemacs-icons-dired
;;   :after treemacs dired
;;   :config (treemacs-icons-dired-mode))
;; (use-package treemacs-magit
;;   :after treemacs magit)

(message "==> INIT: trees.el")

(provide 'trees)

;;; trees.el ends here
