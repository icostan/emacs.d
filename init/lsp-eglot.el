;;; lsp-eglot.ex --- Language Server Protocol client
;;; Commentary:
;;; Code:

(use-package eglot
  :ensure-system-package ;; (binary . package-name)
  ((ccls . ccls)
   (clangd . clang)
   (cmake-language-server . cmake-language-server)
   (elixir-ls . elixir-ls)
   (solargraph  . ruby-solargraph))
  :hook
  (python-mode . eglot-ensure)
  (elixir-mode . eglot-ensure)
  (cc-mode . eglot-ensure)
  (css-mode . eglot-ensure)
  (html-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode "elixir-ls")))

(provide 'lsp-eglot)

;;; lsp-eglot.el ends here
