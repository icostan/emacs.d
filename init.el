;;; init.el --- Init

;;; Code:

(setq user-emacs-directory "~/.vanilla.d/")

;;; load path
(add-to-list 'load-path (expand-file-name "langs" "~/Projects/emacs.d"))
(add-to-list 'load-path (expand-file-name "markups" "~/Projects/emacs.d"))

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
;; (set-face-attribute 'default t :font "Monospace-7")
;; (set-face-attribute 'default t :font "Source Code Pro-7")
;; (set-face-attribute 'default t :font "Monaco-7")
;; (set-face-attribute 'default t :font "Consolas-7")
;; (set-face-attribute 'default t :font "Inconsolata-8")
;; (set-face-attribute 'default t :font "Anonymous Pro-8")
;; (set-face-attribute 'default t :font "DejaVu Sans Mono-7")
;; (set-face-attribute 'default t :font "xos4 Terminus")
(set-face-attribute 'default t :font "Source Code Pro-7:bold")
;; (set-face-attribute 'default t :font "Bitstream Vera Sans Mono-7:style=Roman")

(add-to-list 'default-frame-alist '(font . "Source Code Pro-7:bold"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Package config

;;; Commentary:
;;

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
(setq use-package-always-ensure t
      use-package-compute-statistics t)

;; other use-package' goodies
(use-package use-package-ensure-system-package)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-interval 7
	auto-package-update-hide-results nil))
(use-package use-package-chords
  :config (key-chord-mode 1))

;; Bootstrap Straight
;;; https://github.com/raxod502/straight.el

;; Vim mode
(use-package evil
  :config
  (evil-mode 1))
(use-package evil-escape
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
  :config
  (setq
      ;; foreground and background
      monokai-foreground     "#F8F8FF"
      ;; monokai-background     "#282C34"
      ;; highlights and comments
      monokai-comments       "#75715E"
      ;; monokai-emphasis       "#282C34"
      ;; monokai-highlight      "#FFB269"
      ;; monokai-highlight-alt  "#66D9EF"
      ;; monokai-highlight-line "#1B1D1E"
      ;; monokai-line-number    "#F8F8F0"
      ;; colours
      ;; monokai-blue           "#61AFEF"
      ;; monokai-cyan           "#56B6C2"
      ;; monokai-green          "#98C379"
      ;; monokai-gray           "#3E4451"
      ;; monokai-violet         "#C678DD"
      ;; monokai-red            "#E06C75"
      ;; monokai-orange         "#D19A66"
      ;; monokai-yellow         "#E5C07B"
   )
  (load-theme 'monokai t))

;; Helm
(use-package helm
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
  ;; :general
  ;; (general-nmap "g /" '(helm-swoop :wk "search"))
  :after helm
  :init
  (setq helm-swoop-pre-input-function
        (lambda ()
          (if mark-active
              (buffer-substring-no-properties (mark) (point))
            ""))))
(use-package helm-ag
  :after helm)

;; Which Key
(use-package which-key
  :init
  (setq which-key-separator " "
	which-key-prefix-prefix "+")
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
(defun vanilla/buffers-dashboard ()
  "Show dashboard."
  (interactive)
  (switch-to-buffer "*dashboard*"))
(defun vanilla/record-video ()
  "Print DEMO START message and start video recording."
  (interactive)
  (camcorder-mode 'toggle)
  (message " *** DEMO START - DEMO START - DEMO START *** "))
(defun vanilla/record-gif ()
  "Print DEMO START message and start GIF recording."
  (interactive)
  (gif-screencast-start-or-stop)
  (message " *** DEMO START - DEMO START - DEMO START *** "))
(use-package general
  :init (general-evil-setup)
  :config (general-define-key
           :states '(normal visual insert emacs)
           :prefix "SPC"
           :non-normal-prefix "M-SPC"
           :keymaps 'override
           "/"   '(counsel-rg :wk "ripgrep") ; You'll need counsel package for this
           "TAB" '(switch-to-prev-buffer :wk "previous buffer")
           "SPC" '(helm-M-x :wk "M-x")
           ;; Apps
           "a"   '(nil :wk "apps")
           "at"  '(ansi-term :wk "open terminal")
           ;; Buffers
           "b"   '(nil :wk "buffers")
           "bb"  '(helm-buffers-list :wk "any buffer")
           "bp"  '(helm-projectile-switch-to-buffer :wk "project buffer")
           "bd"  '(kill-buffer :wk "delete")
           "bs"  '(save-buffer :wk "save")
           "be"  '(eval-buffer :wk "eval")
           "bf"  '(lsp-format-buffer :wk "format")
           "bg"  '(nil :wk "goto")
           "bgd"  '(vanilla/buffers-dashboard :wk "dashboard")
           "bgm"  '(view-echo-area-messages :wk "messages")
           ;; Comments
           "c"   '(nil :wk "comments")
           "cc"  '(evilnc-copy-and-comment-lines :wk "copy")
           "ci"  '(evilnc-comment-or-uncomment-lines :wk "lines")
           "cp"  '(evilnc-comment-or-uncomment-paragraphs :wk "paragraphs")
           "cc"  '(compile :wk "compile")
           ;; Debug
           "d"   '(nil :wk "debug")
           "dp"  '(dap-debug :wk "dap")
           "de"  '(edebug-defun :wk "edebug-defun")
           "dd"  '(nil :wk "disassembly")
           "ddg"  '(vanilla/disaster-with-gcc :wk "with gcc")
           "ddc"  '(vanilla/disaster-with-clang :wk "with clang")
           "dh"  '(hexl-find-file :wk "file in HEX")
	   ;; Emacs
           "e"   '(nil :wk "emacs")
           "eu"  '(auto-package-update-now :wk "update now")
           "ee"  '(eval-last-sexp :wk "eval sexp")
           "ed"  '(eval-defun :wk "eval defun")
	   "eb"  '(backward-up-list :wk "backward up")
	   "ei"  '(indent-pp-sexp :wk "indent sexp")
           "E"   '(nil :wk "editing")
	   "Es"  '(sort-lines :wk "sort lines")
	   "El"  '(flycheck-list-errors :wk "list errors")
           ;; Files
           "f"   '(nil :wk "files")
           "ff"  '(helm-projectile-find-file :wk "find file (default)")
           "fo"  '(projectile-find-file-other-window :wk "file in other window")
           "fG"  '(helm-locate :wk "file/directory globally")
           "fp"  '(helm-projectile-find-file :wk "find in project")
           "fP"  '(helm-projectile-find-file-in-known-projects :wk "file in known projects")
           "fe"  '(helm-projectile-find-other-file :wk "find extension")
           "fj"  '(dired-jump :wk "find current directory")
           "fd"  '(helm-projectile-find-dir :wk "find directory in project")
           "fs"  '(save-buffer :wk "save file")
           ;; Git
           "g"   '(nil :wk "git")
           "gg"  '(magit-status :wk "default (status)")
           "gs"  '(magit-status :wk "status")
           "gf"  '(with-editor-finish :wk "finish")
           "gc"  '(with-editor-cancel :wk "cancel")
           ;; Help
           "h"   '(nil :wk "help")
           "hh"  '(which-key-show-top-level :wk "top level")
           "hs"  '(use-package-report :wk "use-package report")
           "ha"  '(nil :wk "apropos")
           "haa"  '(apropos-all-words :wk "all")
           "hac"  '(apropos-command :wk "command")
           "haf"  '(apropos-function :wk "function")
           "hav"  '(apropos-variable :wk "variable")
           "hd"  '(nil :wk "describe")
           "hdd"  '(helpful-at-point :wk "token at point")
           "hdv"  '(helpful-variable :wk "variable")
           "hdc"  '(helpful-command :wk "command")
           ;; "hdf"  '(helpful-callable :wk "function or macro")
           "hdf"  '(helpful-function :wk "function only")
           "hdm"  '(describe-mode :wk "mode")
           "hdk"  '(helpful-key :wk "key")
           "hdK"  '(counsel-describe-map :wk "keymap")
           "hdb"  '(counsel-descbinds :wk "bindings")
           "hda"  '(counsel-describe-face :wk "face")
           "hdF"  '(describe-font :wk "font")
           "hdt"  '(describe-theme :wk "theme")
           "hdp"  '(describe-package :wk "package")
           "hdC"  '(describe-char :wk "char")
           "hi"  '(info :wk "info")
           "hr"  '(repeat-complex-command :wk "repeat")
           "he"  '(view-echo-area-messages :wk "view echo")
           "ho"  '(nil :wk "online")
           "hod"  '(devdocs-search :wk "devdocs")
	   ;; Insert
	   "i"   '(nil :wk "insert")
	   "ii"   '(yas-insert-snippet :wk "default (snippet)")
	   "is"   '(yas-insert-snippet :wk "snippet")
	   "il"   '(lorem-ipsum-insert-sentences :wk "lorem ipsum")
           ;; Jump
           "j"   '(nil :wk "jump")
           "jj"  '(helm-lsp-workspace-symbol :wk "default (to symbol)")
           "jf"  '(helm-semantic-or-imenu :wk "function in file")
           "jF"  '(helm-imenu-in-all-buffers :wk "function in buffers")
           "jc"  '(ace-jump-char-mode :wk "to char")
           "jw"  '(ace-jump-word-mode :wk "to word")
           "jl"  '(ace-jump-line-mode :wk "to line")
           "jd"  '(lsp-find-declaration :wk "to declaration")
           "jD"  '(lsp-goto-type-definition :wk "to definition")
           "ji"  '(lsp-goto-implementation :wk "to implementation")
           "js"  '(helm-lsp-workspace-symbol :wk "to symbol")
           "jS"  '(helm-lsp-global-workspace-symbol :wk "to all symbols")
           ;; Ledger
           "l"   '(nil :wk "ledger")
           "ll"  '(ledger-add-transaction :wk "default (add transaction)")
           "la"  '(ledger-add-transaction :wk "add transaction")
           "lf"  '(ledger-mode-clean-buffer :wk "format")
           ;; Org
           "o"   '(nil :wk "org")
           "oe"  '(org-babel-execute-src-block :wk "execute block")
           "oE"  '(org-babel-execute-maybe :wk "execute all blocks")
           "oT"  '(org-babel-tangle :wk "Tangle blocks")
           "oS"  '(org-tanglesync-process-buffer-automatic :wk "tangle Sync")
           "ot"  '(org-todo :wk "todo")
           "oj"  '(org-journal-new-entry :wk "new journal entry")
           "oC"  '(org-capture :wk "capture")
           "oc"  '(org-toggle-checkbox :wk "checkbox")
           "oa"  '(org-agenda-list :wk "agenda")
           "og"  '(org-set-tags-command :wk "tag")
           "op"  '(org-priority :wk "priority")
           "o>"  '(org-demote-subtree :wk "demote")
           "o<"  '(org-promote-subtree :wk "promote")
           "os"  '(org-schedule :wk "schedule")
           "oi"  '(org-insert-structure-template :wk "insert")
           "on"  '(org-next-visible-heading :wk "next")
           "ol"  '(org-insert-link :wk "link")
           "oI"  '(org-toggle-inline-images :wk "toggle images")
           "oh"  '(org-preview-html-mode :wk "html preview")
           ;; Project
           "p"   '(nil :wk "projects")
           "pf"  '(helm-projectile-find-file :wk "find files")
           "pp"  '(helm-projectile-switch-project :wk "switch project")
           "po"  '(vanilla/projectile-goto-todos :wk "todos")
           "pb"  '(helm-projectile-switch-to-buffer :wk "switch buffer")
           "pr"  '(projectile-root-local :wk "root")
           ;; Replace
           "r"   '(nil :wk "replace")
           "rr"  '(query-replace :wk "default (in file)")
           "rf"  '(query-replace :wk "in file")
           "rp"  '(helm-projectile-ag :wk "in project")
           ;; Recording
           "R"   '(nil :wk "record")
           "Rv"  '(vanilla/record-video :wk "video cast")
           "Rc"  '(camcorder-convert-to-gif :wk "convert video-to-gif")
           "Rg"  '(vanilla/record-gif :wk "gif cast")
           "Rl"  '(clm/toggle-command-log-buffer :wk "toggle command log")
	   "Rk"  '(keycast-mode :wk "toggle keycast log")
           ;; Search
           "s"   '(nil :wk "search")
           "ss"  '(helm-swoop :wk "default (in file)")
           "sf"  '(helm-swoop :wk "in file")
           "sB"  '(helm-multi-swoop-all :wk "in all buffers")
           "sb"  '(helm-multi-swoop-projectile :wk "in project buffers")
           "sm"  '(helm-multi-swoop-current-mode :wk "in mode buffers")
           "so"  '(helm-multi-swoop-org :wk "in org buffers")
           "sd"  '(helm-do-grep-ag :wk "in directory")
           "sP"  '(helm-do-pdfgrep-1 :wk "in PDFs")
           "sp"  '(helm-projectile-ag :wk "in project")
           "sr"  '(lsp-find-references :wk "references")
           "sR"  '(lsp-ui-peek-find-references :wk "references (peek)")
	   ;; Spelling
	   "S"    '(nil :wk "spell")
	   "Sw"   '(flyspell-correct-at-point :wk "word")
	   "Sn"   '(flyspell-correct-next :wk "next")
	   "Sb"   '(flyspell-buffer :wk "buffer")
	   "St"   '(flyspell-mode :wk "toggle")
	   "Si"   '(ispell-buffer :wk "interactive buffer")
           ;; "ss"  '(lsp-ui-find-workspace-symbol :wk "symbols")
           "sS"  '(lsp-ui-peek-find-workspace-symbol :wk "symbols (peek)")
           "sg"  '(find-grep :wk "with grep")
	   ;; Treemacs
           "t"   '(nil :wk "treemacs")
	   "ts"  '(sort-lines :wk "sort line")
           "te"  '(lsp-treemacs-errors-list :wk "errors")
           "tr"  '(lsp-treemacs-references :wk "references")
           "ts"  '(lsp-treemacs-symbols :wk "symbols")
	   "tt"  '(treemacs :wk "treemacs")
           ;; Windows
           "w"   '(nil :wk "windows")
           "wl"  '(windmove-right :wk "move right")
           "wh"  '(windmove-left :wk "move left")
           "wk"  '(windmove-up :wk "move up")
           "wj"  '(windmove-down :wk "move bottom")
           "ww"  '(ace-select-window :wk "move to any")
           "w|"  '(split-window-right :wk "split right")
           "w-"  '(split-window-below :wk "split bottom")
           "wd"  '(delete-window :wk "delete any")
           "wD"  '(ace-delete-window :wk "delete window")
           "wx"  '(delete-other-windows :wk "delete other window")
           "wm"  '(minimap-mode :wk "toggle minimap")
           ;; "ww"  '(other-window :wk "next window")
           "wg"  '(golden-ratio-toggle-widescreen :wk "golden ratio")
           "ws"  '(ace-swap-window :wk "swap")
           ;; Quit
           "q"  '(nil :wk "quit")
           "qr" '(restart-emacs :wk "restart emacs")
           "qq" '(kill-emacs :wk "quit emacs")
           "qm" '(make-frame :wk "make frame")
           "qd" '(delete-frame :wk "delete frame")
           "qf" '(toggle-frame-fullscreen :wk "fullscreen")
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

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))
(use-package flycheck-aspell
  :after flycheck
  :load-path "~/Projects/emacs.d/lisp"
  :config
  (add-to-list 'flycheck-checkers 'tex-aspell-dynamic))

;; Programming languages
(require 'asm)
(require 'go)
(require 'pine)
(require 'python)
(require 'ruby)
(require 'emacs-lisp)

;; Markups
(require 'yaml)
(require 'html)
(require 'orgmode)

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
(use-package forge
  :after magit)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Disable backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Move
(use-package ace-jump-mode
  :general
  (general-nmap "g l" '(ace-jump-line-mode :wk "to line")
                "g w" '(ace-jump-word-mode :wk "to word")
                "g W" '(evil-fill :wk "evil-fill (unbound w)")
                "g c" '(ace-jump-char-mode :wk "to char")))
;; (use-package ace-jump-mode
;;   :chords (("gc" . ace-jump-char-mode)
;;            ("gw" . ace-jump-word-mode)
;;            ("gl" . ace-jump-line-mode)))
;; (use-package avy
;;   :bind (("C-c j l" . avy-goto-line)
;;          ("C-c j a" . avy-goto-char-timer))

;; Presentation
(use-package demo-it
  :config
  (use-package org-tree-slide))

;; Screen casting
;; https://gitlab.com/marcowahl/emacsshot
(use-package camcorder)
(use-package gif-screencast)

;; Display typed commands
(use-package command-log-mode)
(use-package keycast)

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
;; try evil-window: "C-w"
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
  :general
  (general-nmap ", f" '(lsp-format-buffer :wk "format")
                ", o" '(switch-to-buffer("*ruby-ls*") :wk "output"))
  :hook (prog-mode . lsp)
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil
	;; lsp-log-io t
	lsp-signature-auto-activate t
	lsp-signature-render-documentation t
	lsp-solargraph-use-bundler t))
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-position 'top))
(use-package company-lsp
  :commands company-lsp
  :config
  (setq company-lsp-enable-snippet t))
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; Debugging
(use-package dap-mode
  :config
  (dap-mode 1)
  (dap-ui-mode 1)
  (dap-tooltip-mode 1))
;; (use-package dap-gdb-lldb
;;   :after dap-mode)
(use-package edebug-x)
(use-package open-junk-file)

;; treemacs
;; (use-package tree)
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
  :config
  (setq dashboard-items '((agenda . 10)
			  (projects . 10))
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

;; enable electric parens
(electric-pair-mode)

;; enable flyspell
(flyspell-prog-mode)
;; (use-package flyspell-correct)

;;; Lorem
(use-package lorem-ipsum)

;;; Call graph
(use-package ggtags)
;; (use-package call-graph
;;   :after ggtags)

(use-package helpful)
;; (use-package lookup)
(use-package counsel)
(use-package minimap
  :config
  (setq minimap-width-fraction 0.05))

;;; devdocs
(use-package devdocs)

;;; rg
(use-package rg
  :ensure-system-package
  (rg . ripgrep))

;;; init.el ends here
