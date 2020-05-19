;;; yaml.el --- Yaml

;;; Commentary:
;; YAML Ain't Markup Language - maybe move it to data interchange section of something

;;; Code:

(use-package yaml-mode
  :ensure-system-package (yaml-language-server . "npm i -g yaml-language-server"))

(provide 'yaml)

;;; yaml.el ends here
