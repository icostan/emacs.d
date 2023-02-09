;;; vim.el --- Vim emulation with evil mode
;;; Commentary:
;;; Code:

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-w-in-emacs-state t)
  ;; (setq evil-default-state 'emacs)
  (setq evil-buffer-regexps '(("Calculator" . nil)))
  :config
  (evil-mode 1))

(use-package evil-escape
  :init
  (setq-default evil-escape-key-sequence "jk")
  (setq evil-escape-enable-only-for-major-modes nil)
  ;; (setq evil-escape-enable-only-for-major-modes '(prog-mode emacs-lisp-mode org-journal-mode org-mode ledger-mode))
  :config
  (evil-escape-mode 1))

(use-package evil-unimpaired
  :load-path "lisp"
  :config
  (evil-unimpaired-mode))

;;; commenting
(use-package evil-nerd-commenter
  ;; :general
  ;; (general-nmap ", l" '(nil :wk "unused comments"))
  :config
  (evilnc-default-hotkeys))
;; (use-package evil-commentary
;;   :config
;;   (evil-commentary-mode))
;; Key binding in normal, or insert mode

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
;;; align operators
;; (use-package evil-lion
;;   :config
;;   (evil-lion-mode))

(use-package evil-matchit
  :config (global-evil-matchit-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(message "==> INIT: vim.el")

(provide 'vim)

;;; vim.el ends here
