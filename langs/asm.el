;;; asm.el --- Asm

;;; Commentary:
;;

;;; Code:

(use-package disaster
  :config
  (setq disaster-objdump "objdump -d -M intel")
  (setq disaster-project-root-files (list (list "setup.py" "package.json"))))

(provide 'asm)

;;; asm.el ends here
