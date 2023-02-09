;;; json.el --- JSON
;;; Commentary:
;;; Code:

(use-package json-mode
  :mode "\\.json\\'"
  :general
  (general-nmap
    :major-modes t
    "z f" '(json-pretty-print-buffer :wk "format JSON")))

(provide 'json)

;;; json.el ends here
