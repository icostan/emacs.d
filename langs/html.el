;;; html.el --- Html
;;; Commentary:
;;; Code:

(use-package mhtml-mode
  :ensure-system-package (vscode-html-language-server . vscode-langservers-extracted)
  :general
  (general-nmap
    :major-modes t
    "z f" '(sgml-pretty-print :wk "format HTML")))

(use-package html-check-frag
  :hook (html-mode . (lambda () (html-check-frag-mode 1))))

(provide 'html)

;;; html.el ends here
