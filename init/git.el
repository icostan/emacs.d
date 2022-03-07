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

;; TODO move to ui.el
(use-package posframe)

(message (concat "==> INIT: git.el"))

(provide 'git)

;;; git.el ends here
