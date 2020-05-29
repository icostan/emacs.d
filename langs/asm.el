;;; asm.el --- Asm
;;; Commentary:
;;; Code:

(use-package disaster
  :custom
  (disaster-objdump "objdump -d -M intel")
  (disaster-project-root-files (list (list "setup.py" "package.json"))))

(provide 'asm)

;;; asm.el ends here
