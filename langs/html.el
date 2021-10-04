;;; html.el --- Html
;;; Commentary:
;;; Code:

(use-package mhtml-mode
  :general
  (general-nmap
    ;; :predicate '(eq major-mode 'mhtml-mode)
    :major-modes t
    "z f" '(sgml-pretty-print :wk "format HTML"))
  :ensure-system-package (html-languageserver . "npm i -g vscode-html-languageserver-bin"))

(use-package html-check-frag
  :hook (html-mode . (lambda () (html-check-frag-mode 1))))

(provide 'html)

;;; html.el ends here
