;;; git.el --- Git
;;; Commentary:
;;; Code:

(use-package vc
  :general
  (icostan/leader-keys
    :states 'normal
    "v"   '(:ignore t :wk "version-control")
    "vd"  '(vc-dir :wk "status (dir)")
    "vl"  '(vc-print-log :wk "log")))

(use-package magit
  ;; :if (icostan/use-git)
  :custom
  (magit-display-buffer-function 'magit-display-buffer-traditional)
  :general
  (icostan/leader-keys
    :states 'normal
    "v"   '(:ignore t :wk "version-control: git")
    "vv"  '(magit-status :wk "status")
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
    :states 'normal
    "vw" '(why-this :wk "why this")))

(message (concat "==> INIT: git.el"))

(provide 'git)

;;; git.el ends here
