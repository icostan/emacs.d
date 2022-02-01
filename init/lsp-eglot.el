;;; lsp-eglot.ex --- Language Server Protocol client
;;; Commentary:
;;; Code:

(use-package eglot
  :hook
  (python-mode . eglot-ensure)
  (elixir-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode "elixir-ls")))

(provide 'lsp-eglot)

;;; lsp-eglot.el ends here
