;;; all.el --- All langs
;;; Commentary:
;;
;;; Code:

(use-package format-all
  :ensure-system-package (prettier)
  :ensure-system-package (tidy)
  :ensure-system-package (black . "pip install black")
  :ensure-system-package (rufo . "gem install rufo"))

(provide 'all)

;;; all.el ends here
