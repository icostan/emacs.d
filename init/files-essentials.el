;;; files-essentials.el --- Files essentials
;;; Commentary:
;;; Code:

(use-package browse-at-remote)

(use-package file-info
  :after (hydra browse-at-remote)
  :general
  (icostan/leader-keys
    "f"   '(nil :wk "files")
    "ff"  '(find-file :wk "find file (default)")
    "fF"  '(find-file-other-window :wk "file in other window")
    "fG"  '(consult-locate :wk "file/directory globally")
    "fP"  '(consult-project-extra-projects :wk "file in known projects")
    "fj"  '(dired-jump :wk "find current directory")
    "fd"  '(dirvish-dired :wk "dired dirvish")
    "fi"  '(file-info-show :wk "info")
    "fs"  '(save-buffer :wk "save file"))
  :config
  (setq hydra-hint-display-type 'posframe)
  (setq hydra-posframe-show-params `(:poshandler posframe-poshandler-frame-center
                                               :internal-border-width 2
                                               :internal-border-color "#61AFEF"
                                               :left-fringe 16
                                               :right-fringe 16)))

(provide 'files-essentials)

;;; files-essentials.el ends here
