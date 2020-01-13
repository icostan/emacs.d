;; Config directory
(setq user-emacs-directory "~/.vanilla.d/")

;; Minimal UI
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(menu-bar-mode   -1)
(tooltip-mode    -1)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Display continuous lines
(setq-default truncate-lines nil)
(setq-default truncate-partial-width-windows nil)

;; Line and column #
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(line-number-mode t)
(column-number-mode t)

;; Font and frame size
(set-face-attribute 'default t :font "Source Code Pro-7" )
(add-to-list 'default-frame-alist '(font . "Source Code Pro-7"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Package config
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'use-package-ensure))
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))
(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))
(use-package evil-unimpaired
  :load-path "~/Projects/emacs.d/lisp"
  :config
  (evil-unimpaired-mode))
(use-package evil-nerd-commenter
  :config
  (evilnc-default-hotkeys))

;; Theme
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
        helm-mode-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-locate-fuzzy-match t
        helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-candidate-number-list 150
        helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-echo-input-in-header-line t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20)
  :config
  (helm-mode 1))
(use-package helm-swoop
  :after helm
  :init
  (setq helm-swoop-pre-input-function
        (lambda ()
          (if mark-active
              (buffer-substring-no-properties (mark) (point))
            ""))))

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

;; General keybindings
(defun vanilla/projectile-goto-todos ()
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name)))
(use-package general
  :ensure t
  :config (general-define-key
           :states '(normal visual insert emacs)
           :prefix "SPC"
           :non-normal-prefix "M-SPC"
           :keymaps 'override
           ;; "/"   '(counsel-rg :which-key "ripgrep") ; You'll need counsel package for this
           "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
           "SPC" '(helm-M-x :which-key "M-x")
           ;; Apps
           "a"   '(nil :which-key "apps")
           "at"  '(ansi-term :which-key "open terminal")
           ;; Buffers
           "b"   '(nil :which-key "buffers")
           "bb"  '(helm-buffers-list :which-key "list")
           "bd"  '(kill-buffer :which-key "delete")
           "bs"  '(save-buffer :which-key "save")
           "be"  '(eval-buffer :which-key "eval")
           ;; Comments
           "c"   '(nil :which-key "comments")
           "cc"  '(evilnc-copy-and-comment-lines :which-key "copy")
           "ci"  '(evilnc-comment-or-uncomment-lines :which-key "lines")
           "cp"  '(evilnc-comment-or-uncomment-paragraphs :which-key "paragraphs")
           ;; Files
           "f"   '(nil :which-key "files")
           "ff"  '(helm-find-files :which-key "find files")
           "fj"  '(dired-jump :which-key "find directory")
           "fs"  '(save-buffer :which-key "save file")
           ;; Git
           "g"   '(nil :which-key "git")
           "gs"  '(magit-status :which-key "status")
           "gf"  '(with-editor-finish :which-key "finish")
           "gc"  '(with-editor-cancel :which-key "cancel")
           ;; Help
           "h"   '(nil :which-key "help")
           "ha"  '(apropos-command :which-key "apropos")
           "hv"  '(describe-variable :which-key "describe variable")
           "hf"  '(describe-function :which-key "describe function")
           "hk"  '(describe-key :which-key "describe key")
           "hK"  '(describe-keymap :which-key "describe keymap")
           "hb"  '(describe-bindings :which-key "describe bindings")
           "hp"  '(describe-package :which-key "describe package")
           ;; Jump
           "j"   '(nil :which-key "jump")
           "jf"  '(helm-semantic-or-imenu :which-key "function in file")
           "jF"  '(helm-imenu-in-all-buffers :which-key "function in buffers")
           "jc"  '(ace-jump-char-mode :which-key "to chat")
           "jw"  '(ace-jump-word-mode :which-key "to word")
           "jl"  '(ace-jump-line-mode :which-key "to line")
           ;; Ledger
           "l"   '(nil :which-key "ledger")
           "la"  '(ledger-add-transaction :which-key "add transaction")
           "lf"  '(ledger-mode-clean-buffer :which-key "format")
           ;; Org
           "o"   '(nil :which-key "org")
           "oe"  '(org-babel-execute-maybe :which-key "execute block")
           "ot"  '(org-todo :which-key "todo")
           "oj"  '(org-journal-new-entry :which-key "new journal entry")
           "oc"  '(org-toggle-checkbox :which-key "checkbox")
           "oa"  '(org-agenda-list :which-key "agenda")
           "og"  '(org-set-tags-command :which-key "tag")
           "op"  '(org-priority :which-key "priority")
           "o>"  '(org-demote-subtree :which-key "demote")
           "o<"  '(org-promote-subtree :which-key "promote")
           "os"  '(org-schedule :which-key "schedule")
           "oi"  '(org-insert-structure-template :which-key "insert")
           "on"  '(org-next-visible-heading :which-key "next")
           ;; Project
           "p"   '(nil :which-key "projects")
           "pf"  '(helm-projectile-find-file :which-key "find files")
           "pp"  '(helm-projectile-switch-project :which-key "switch project")
           "po"  '(vanilla/projectile-goto-todos :which-key "todos")
           "pb"  '(helm-projectile-switch-to-buffer :which-key "switch buffer")
           ;; Recording
           "r"   '(nil :which-key "record")
           "rt"  '(camcorder-mode :which-key "toggle")
           "rr"  '(camcorder-record :which-key "record")
           "rc"  '(camcorder-convert-to-gif :which-key "convert")
           ;; Search
           "s"   '(nil :which-key "search")
           "sf"  '(helm-swoop :which-key "in file")
           "sB"  '(helm-multi-swoop-all :which-key "in all buffers")
           "sb"  '(helm-multi-swoop-projectile :which-key "in project buffers")
           "sm"  '(helm-multi-swoop-current-mode :which-key "in mode buffers")
           "so"  '(helm-multi-swoop-org :which-key "in org buffers")
           "sp"  '(helm-do-grep-ag :which-key "in project")
           "sr"  '(query-replace :which-key "replace")
	   ;; Text
	   "ts"  '(sort-lines :which-key "sort line")
           ;; Windows
           "w"   '(nil :which-key "windows")
           "wl"  '(windmove-right :which-key "move right")
           "wh"  '(windmove-left :which-key "move left")
           "wk"  '(windmove-up :which-key "move up")
           "wj"  '(windmove-down :which-key "move bottom")
           "w/"  '(split-window-right :which-key "split right")
           "w-"  '(split-window-below :which-key "split bottom")
           "wd"  '(delete-window :which-key "delete window")
           "wx"  '(delete-other-windows :which-key "delete other window")
           "ww"  '(other-window :which-key "next window")
           "wg"  '(golden-ratio-toggle-widescreen :which-key "golden ratio")
           ;; Quit
           "q"   '(nil :which-key "quit")
           "qr" '(restart-emacs :which-key "restart emacs")
           "qq" '(kill-emacs :which-key "quit emacs")
           ))

;; Fancy titlebar for MacOS
;; (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;; (add-to-list 'default-frame-alist '(ns-appearance . dark))
;; (setq ns-use-proxy-icon  nil)
;; (setq frame-title-format nil)

;; Projectile
(use-package projectile
  ;; :init
  ;; :bind
  ;; (("C-p p" . projectile-switch-project-action))
  ;; :bind-keymap
  ;; ("C-c p" . projectile-command-map)
  :config
  ;; (define-key projectile-mode-map (kbd "SPC-p") 'projectile-command-map)
  ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))
(use-package org-projectile
  :init
  :config
  (org-projectile-per-project)
  (setq org-projectile-per-project-filepath "TODOs.org")
  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  (push (org-projectile-project-todo-entry) org-capture-templates))
(use-package helm-projectile
  :config
  (helm-projectile-on))

;; NeoTree
(use-package neotree
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
;; (use-package all-the-icons :ensure t)

;; Code Snippets
(use-package yasnippet
  :init (yas-global-mode 1))
(use-package yasnippet-snippets
  :after yasnippet)

;; Programming languages
(use-package ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby")
(use-package rspec-mode
  :after ruby-mode
  :config (rspec-install-snippets))
(use-package bundler
  :after ruby-mode)
(use-package rbenv
  :after ruby-mode
  :config (global-rbenv-mode))

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;; Coverage
(use-package cov
  :config
  (setq gcov-coverage-file-paths '("." "../coverage/lcov" "../../coverage/lcov"))
  (setq gcov-coverage-alist '((".lcov" . lcov))))

;; Orgmode
(use-package org
  :ensure org-plus-contrib
  :init
  (setq org-confirm-babel-evaluate nil)
  (setq org-agenda-files (directory-files-recursively "~/Projects" "TODOs\\.org"))
  (setq org-agenda-window-setup 'other-window)
  (setq org-agenda-restore-windows-after-quit t)
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (haskell . t)
     (ledger . t)
     (python . t)
     (ruby . t)
     (shell . t)
     (sql . nil))))
(use-package org-journal
  :after org
  :init
  (setq org-journal-dir "~/Projects/org.d/journal")
  (setq org-journal-file-type 'monthly)
  :config
  (setq org-journal-date-format "%A, %x")
  (setq org-journal-time-format "")
  (setq org-journal-time-prefix "  - [ ] "))

;; Company mode for Completion
(use-package company
  :defer t
  :diminish company-mode
  :init (global-company-mode))

;; Git
(use-package magit
  :config
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))
(use-package evil-magit
  :after magit)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Disable backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Move
(use-package ace-jump-mode)
;; (use-package avy
;;   :bind (("C-c j l" . avy-goto-line)
;;          ("C-c j a" . avy-goto-char-timer))

;; Presentation
(use-package demo-it
  :config
  (use-package org-tree-slide))

;; Screencasting
(use-package camcorder)
;; https://gitlab.com/ambrevar/emacs-gif-screencast
;; https://gitlab.com/marcowahl/emacsshot

;; display typed commands
(use-package command-log-mode)

;; Ledger
(use-package ledger-mode
  :config
  (setq ledger-post-amount-alignment-column 62)
  (setq ledger-accounts-file "accounts.ledger"))
(use-package flycheck-ledger
  :after ledger-mode)
(use-package evil-ledger
  :after ledger-mode
  :config
  (setq evil-ledger-sort-key "S")
  (add-hook 'ledger-mode-hook #'evil-ledger-mode))

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'after-init-hook 'org-agenda-list)

;; Windows
(use-package golden-ratio
  :config
  (golden-ratio-mode 1))

;; Sagemath
(use-package sage-shell-mode)
(use-package ob-sagemath
  :after sage-shell-mode
  :config
 (setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "both"))))

;; Startup home page
(org-agenda-list)
