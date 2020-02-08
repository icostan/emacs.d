;;; package --- Summary
;;; Commentary:

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
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "http://orgmode.org/elpa/")))
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
  "Go to project's TODOs file."
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name)))
(defun vanilla/disaster-with-gcc ()
  "Compile with GCC."
  (interactive)
  (setq disaster-cc "gcc")
  (disaster))
(defun vanilla/disaster-with-clang ()
  "Compile with CLang."
  (interactive)
  (setq disaster-cc "clang")
  (disaster))
(use-package general
  :ensure t
  :config (general-define-key
           :states '(normal visual insert emacs)
           :prefix "SPC"
           :non-normal-prefix "M-SPC"
           :keymaps 'override
           "/"   '(counsel-rg :which-key "ripgrep") ; You'll need counsel package for this
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
           "bf"  '(lsp-format-buffer :which-key "format")
           "bh"  '(dashboard :which-key "format")
           ;; Comments
           "c"   '(nil :which-key "comments")
           "cc"  '(evilnc-copy-and-comment-lines :which-key "copy")
           "ci"  '(evilnc-comment-or-uncomment-lines :which-key "lines")
           "cp"  '(evilnc-comment-or-uncomment-paragraphs :which-key "paragraphs")
           "cc"  '(compile :which-key "compile")
           ;; Debug
           "d"   '(nil :which-key "debug")
           "dg"  '(dap-debug :which-key "debug")
           "dd"  '(nil :which-key "disassembly")
           "ddg"  '(vanilla/disaster-with-gcc :which-key "with gcc")
           "ddc"  '(vanilla/disaster-with-clang :which-key "with clang")
	   ;; Editing
           "e"   '(nil :which-key "editing")
	   "es"  '(sort-lines :which-key "sort line")
           ;; Files
           "f"   '(nil :which-key "files")
           "ff"  '(helm-find-files :which-key "find files")
           "fj"  '(dired-jump :which-key "find directory")
           "fs"  '(save-buffer :which-key "save file")
           ;; Git
           "g"   '(nil :which-key "git")
           "gg"  '(magit-status :which-key "default (status)")
           "gs"  '(magit-status :which-key "status")
           "gf"  '(with-editor-finish :which-key "finish")
           "gc"  '(with-editor-cancel :which-key "cancel")
           ;; Help
           "h"   '(nil :which-key "help")
           "hh"  '(which-key-show-top-level :which-key "default (apropos)")
           "ha"  '(apropos-command :which-key "apropos")
           "hv"  '(describe-variable :which-key "describe variable")
           "hf"  '(describe-function :which-key "describe function")
           "hk"  '(describe-key :which-key "describe key")
           "hK"  '(describe-keymap :which-key "describe keymap")
           "hb"  '(describe-bindings :which-key "describe bindings")
           "hp"  '(describe-package :which-key "describe package")
           "hi"  '(info :which-key "info")
	   ;; Insert
	   "i"   '(nil :which-key "insert")
	   "ii"   '(yas-insert-snippet :which-key "default (snippet)")
	   "is"   '(yas-insert-snippet :which-key "snippet")
	   "il"   '(lorem-ipsum-insert-sentences :which-key "lorem ipsum")
           ;; Jump
           "j"   '(nil :which-key "jump")
           "jj"  '(helm-lsp-workspace-symbol :which-key "default (to symbol)")
           "jf"  '(helm-semantic-or-imenu :which-key "function in file")
           "jF"  '(helm-imenu-in-all-buffers :which-key "function in buffers")
           "jc"  '(ace-jump-char-mode :which-key "to char")
           "jw"  '(ace-jump-word-mode :which-key "to word")
           "jl"  '(ace-jump-line-mode :which-key "to line")
           "jd"  '(lsp-find-declaration :which-key "to declaration")
           "jD"  '(lsp-goto-type-definition :which-key "to definition")
           "ji"  '(lsp-goto-implementation :which-key "to implementation")
           "js"  '(helm-lsp-workspace-symbol :which-key "to symbol")
           "jS"  '(helm-lsp-global-workspace-symbol :which-key "to all symbols")
           ;; Ledger
           "l"   '(nil :which-key "ledger")
           "ll"  '(ledger-add-transaction :which-key "default (add transaction)")
           "la"  '(ledger-add-transaction :which-key "add transaction")
           "lf"  '(ledger-mode-clean-buffer :which-key "format")
           ;; Org
           "o"   '(nil :which-key "org")
           "oe"  '(org-babel-execute-maybe :which-key "execute block")
           "ot"  '(org-todo :which-key "todo")
           "oj"  '(org-journal-new-entry :which-key "new journal entry")
           "oc"  '(org-capture :which-key "capture")
           "oC"  '(org-toggle-checkbox :which-key "checkbox")
           "oa"  '(org-agenda-list :which-key "agenda")
           "og"  '(org-set-tags-command :which-key "tag")
           "op"  '(org-priority :which-key "priority")
           "o>"  '(org-demote-subtree :which-key "demote")
           "o<"  '(org-promote-subtree :which-key "promote")
           "os"  '(org-schedule :which-key "schedule")
           "oi"  '(org-insert-structure-template :which-key "insert")
           "on"  '(org-next-visible-heading :which-key "next")
           "ol"  '(org-insert-link :which-key "link")
           ;; Project
           "p"   '(nil :which-key "projects")
           "pf"  '(helm-projectile-find-file :which-key "find files")
           "pp"  '(helm-projectile-switch-project :which-key "switch project")
           "po"  '(vanilla/projectile-goto-todos :which-key "todos")
           "pb"  '(helm-projectile-switch-to-buffer :which-key "switch buffer")
           ;; Replace
           "r"   '(nil :which-key "replace")
           "rr"  '(query-replace :which-key "default (in file)")
           "rf"  '(query-replace :which-key "in file")
           ;; Recording
           "R"   '(nil :which-key "record")
           "Rt"  '(camcorder-mode :which-key "toggle")
           "Rr"  '(camcorder-record :which-key "record")
           "Rc"  '(camcorder-convert-to-gif :which-key "convert")
           ;; Search
           "s"   '(nil :which-key "search")
           "ss"  '(helm-swoop :which-key "default (in file)")
           "sf"  '(helm-swoop :which-key "in file")
           "sB"  '(helm-multi-swoop-all :which-key "in all buffers")
           "sb"  '(helm-multi-swoop-projectile :which-key "in project buffers")
           "sm"  '(helm-multi-swoop-current-mode :which-key "in mode buffers")
           "so"  '(helm-multi-swoop-org :which-key "in org buffers")
           "sp"  '(helm-do-grep-ag :which-key "in project")
           "sr"  '(lsp-find-references :which-key "references")
           "sR"  '(lsp-ui-peek-find-references :which-key "references (peek)")
           ;; "ss"  '(lsp-ui-find-workspace-symbol :which-key "symbols")
           "sS"  '(lsp-ui-peek-find-workspace-symbol :which-key "symbols (peek)")
	   ;; Treemacs
           "t"   '(nil :which-key "treemacs")
	   "ts"  '(sort-lines :which-key "sort line")
           "te"  '(lsp-treemacs-errors-list :which-key "errors")
           "tr"  '(lsp-treemacs-references :which-key "references")
           "ts"  '(lsp-treemacs-symbols :which-key "symbols")
	   "tt"  '(treemacs :which-key "treemacs")
           ;; Windows
           "w"   '(nil :which-key "windows")
           "wl"  '(windmove-right :which-key "move right")
           "wh"  '(windmove-left :which-key "move left")
           "wk"  '(windmove-up :which-key "move up")
           "wj"  '(windmove-down :which-key "move bottom")
           "ws"  '(ace-select-window :which-key "move to any")
           "w|"  '(split-window-right :which-key "split right")
           "w-"  '(split-window-below :which-key "split bottom")
           "wd"  '(delete-window :which-key "delete any")
           "wD"  '(ace-delete-window :which-key "delete window")
           "wx"  '(delete-other-windows :which-key "delete other window")
           ;; "ww"  '(other-window :which-key "next window")
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
  :config (yas-global-mode 1))
(use-package yasnippet-snippets
  :after yasnippet)

;; Programming languages
;;; Ruby
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
;;; Python
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))
;;; Go
(use-package go-mode
  :mode "\\.go\\'")
;;; Assembler
(use-package disaster
  :config
  (setq disaster-objdump "objdump -d -M intel")
  (setq disaster-project-root-files (list (list "setup.py" "package.json"))))

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;; Coverage
(use-package cov
  :config
  (setq gcov-coverage-file-paths '("." "../coverage/lcov" "../../coverage/lcov"))
  (setq gcov-coverage-alist '((".lcov" . lcov))))

;; Orgmode
(defun icostan/capture_template (name)
  "Return template file for NAME."
  `(file concat("templates/" name)))
(use-package org
  :ensure org-plus-contrib
  :init
  (setq org-confirm-babel-evaluate nil)
  (setq org-agenda-files (directory-files-recursively "~/Projects" "TODOs\\.org"))
  (setq org-agenda-window-setup 'other-window)
  (setq org-agenda-restore-windows-after-quit t)
  :config
  (push '("e" "emacs.d" entry (file+headline "~/Projects/emacs.d/TODOs.org" "Tasks") (file "templates/emacs.d-todo.org")) org-capture-templates)
  (push '("a" "arch.d" entry (file+headline "~/Projects/arch.d/TODOs.org" "Tasks") (file "templates/arch.d-todo.org")) org-capture-templates)
  (setq org-default-notes-file (concat org-directory "/notes.org"))
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
(use-package ace-window)

;; Sagemath
(use-package sage-shell-mode)
(use-package ob-sagemath
  :after sage-shell-mode
  :config
 (setq org-babel-default-header-args:sage '((:session . t)
                                           (:results . "both"))))

;; Language Server Protocol
(use-package lsp-mode
  ;; :init (setq lsp-keymap-prefix "C-c s")
  :hook (prog-mode . lsp)
  :commands lsp
  :config
  ;; (setq lsp-log-io t)
  (setq lsp-prefer-flymake nil)
  ;; (setq lsp-signature-auto-activate t)
  ;; (setq lsp-signature-render-documentation t)
  (setq lsp-solargraph-use-bundler t))
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-position 'top))
(use-package company-lsp
  :commands company-lsp
  :config (setq company-lsp-enable-snippet t))
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; Debug Adapter Protocol
(use-package dap-mode
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1))
;; (use-package dap-gdb-lldb
;;   :after dap-mode)

(use-package open-junk-file)

;; treemacs
(use-package treemacs
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil)
(use-package treemacs-projectile
  :after treemacs projectile)
(use-package treemacs-icons-dired
  :after treemacs dired
  :config (treemacs-icons-dired-mode))
(use-package treemacs-magit
  :after treemacs magit)

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((agenda . 10)
			  (projects . 5))
	dashboard-center-content t
	show-week-agenda t
	dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

;; Wakatime
(use-package wakatime-mode
  :init
  (setq wakatime-api-key "978b706c-dcd2-4d83-955b-25ed115813b9")
  ;; (setq wakatime-api-key (getenv "WAKATIME_KEY"))
  :config
  (global-wakatime-mode))

;;; Lorem
(use-package lorem-ipsum)

;;; init.el ends here
