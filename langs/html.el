;;; html.el --- Html
;;; Commentary:
;;; Code:

(use-package mhtml-mode
  :ensure-system-package (vscode-html-language-server . vscode-langservers-extracted)
  :general
  (general-nmap
    :major-modes t
    :keymaps 'mhtml-mode-map
    "z f" '(sgml-pretty-print :wk "format HTML")
    "z F" '(elixir-format :wk "format (Elixir)")
    ))

(use-package html-check-frag
  :hook (html-mode . (lambda () (html-check-frag-mode 1))))

(provide 'html)

;;; html.el ends here
