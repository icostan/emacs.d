;;; diagrams.el --- Diagrams charts
;;; Commentary:
;;

;;; Code:

(use-package mermaid-mode
  :ensure-system-package (mmdc . mermaid-cli))
(use-package ob-mermaid)

(provide 'diagrams)

;;; diagrams.el ends here
