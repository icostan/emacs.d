;;; javascript.el --- JAVASCRIPT
;;; Commentary:
;;; Code:

(use-package js
  :ensure-system-package (typescript-language-server . typescript-language-server)
  :mode "\\.js\\'")

(use-package typescript-mode
  :ensure-system-package (typescript-language-server . typescript-language-server)
  :mode "\\.ts\\'")

(provide 'javascript)

;;; javascript.el ends here
