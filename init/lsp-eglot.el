;;; lsp-eglot.ex --- Language Server Protocol client
;;; Commentary:
;;; Code:

(use-package sideline-eglot
  :init
  (setq sideline-backends-right '(sideline-eglot))
  :custom
  (sideline-eglot-code-actions-prefix "[eglot]"))

(use-package eglot
  :general
  (general-nmap
    :keymaps 'elixir-mode-map
    :major-modes t
    "g s" '(consult-eglot-symbols :wk "go symbols (Eglot)"))

  :ensure-system-package ;; (binary . package-name)
  ((ccls . ccls)
   (clangd . clang)
   (cmake-language-server . cmake-language-server)
   (tailwindcss-language-server . tailwindcss-language-server)
   (elixir-ls . elixir-ls))
   ;; (solargraph  . ruby-solargraph))
  :hook
  (python-mode . eglot-ensure)
  (elixir-mode . eglot-ensure)
  (cc-mode . eglot-ensure)
  (css-mode . eglot-ensure)
  (html-mode . eglot-ensure)
  (eglot-mode . sideline-mode)
  :config
  (add-to-list 'eglot-server-programs '(elixir-mode "elixir-ls")))
  ;; (add-to-list 'eglot-server-programs
  ;;              '((elixir-mode elixir-ts-mode) . ("language_server.sh"))))

(use-package consult-eglot)
(use-package consult-eglot-embark)

(provide 'lsp-eglot)

;;; lsp-eglot.el ends here
