;;; ide.el --- Integrated Development Environment
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :general
  (general-nmap ", f" '(lsp-format-buffer :wk "format"))
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (python-mode . lsp)
         (c-mode . lsp)
         (ruby-mode . lsp))
  :commands lsp
  :config
  (setq lsp-diagnostic-package :flycheck
        lsp-log-io t
        lsp-signature-auto-activate t
        lsp-signature-render-documentation t
        lsp-solargraph-use-bundler t))
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-position 'top))
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; (use-package company-lsp
;;   :commands company-lsp
;;   :config
;;   (setq company-lsp-enable-snippet t))
(use-package helm-lsp :commands helm-lsp-workspace-symbol)

;; Debugging
;; (use-package dap-mode
;;   :config
;;   (dap-mode 1)
;;   (dap-ui-mode 1)
;;   (dap-tooltip-mode 1))
;; (use-package dap-gdb-lldb
;;   :after dap-mode)
(use-package edebug-x)
(use-package open-junk-file)

;;; Call graph
(use-package ggtags)
;; (use-package call-graph
;;   :after ggtags)

;; CI
;; (use-package travis)

;; (use-package build-status)

;; numbers
;; (use-package highlight-numbers
;;   :hook (prog-mode . highlight-numbers-mode))


(message "==> INIT: ide.el")

(provide 'ide)

;;; ide.el ends here
