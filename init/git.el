;;; git.el --- Git
;;; Commentary:
;;; Code:

(use-package vc
  :general
  (icostan/leader-keys
    "v"   '(:ignore t :wk "version-control")
    "vd"  '(vc-dir :wk "status (dir)")
    "vl"  '(vc-print-log :wk "log")))

(use-package magit
  ;; :if (icostan/use-git)
  :custom
  (magit-display-buffer-function 'magit-display-buffer-traditional)
  :general
  (icostan/leader-keys
    "v"   '(:ignore t :wk "version-control")
    "vv"  '(magit-status :wk "status")
    "vl"  '(consult-git-log-grep :wk "consult log")
    "vf"  '(with-editor-finish :wk "finish")
    "vc"  '(with-editor-cancel :wk "cancel")))

(use-package forge)
(use-package gitconfig)

(use-package why-this
  :quelpa (:fetcher git :repo "https://codeberg.org/akib/emacs-why-this")
  :config (global-why-this-mode)
  :custom
  (why-this-annotate-heat-map-cold "#203448")
  (why-this-annotate-heat-map-warm "#382f27")
  (why-this-enable-tooltip nil)
  :general
  (icostan/leader-keys
    "v"  '(:ignore t :wk "version-control")
    "vw" '(why-this :wk "why this")))

(use-package consult-git-log-grep
  :custom
  (consult-git-log-grep-open-function #'magit-show-commit))

(use-package lab
  :ensure t
  :quelpa (lab :fetcher github :repo "isamert/lab.el")
  :init
  (setq lab-host "https://gitlab.com")
  (setq lab-token (getenv "EMACS_LAB_TOKEN"))
  :general
  (icostan/leader-keys
    "v"  '(:ignore t :wk "version-control")
    "vg" '(lab-list-all-owned-projects :wk "gitlab"))
  :config
  (define-advice magit-push-current-to-pushremote (:after (&rest _) start-watching-pipeline)
    (lab-watch-pipeline-for-last-commit)))

(message (concat "==> INIT: git.el"))

(provide 'git)

;;; git.el ends here
