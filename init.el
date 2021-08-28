;;; init.el --- Init file -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Iulian Costan

;; Author: Iulian Costan
;; Keywords: lisp dotemacs init
;; URL: https://github.com/icostan/emacs.d
;; Package-Version: 1.0
;; Package-Requires: ((emacs "26.1"))

;; SPDX-License-Identifier: MIT

;;; Commentary:
;; Emacs configuration

;;; Code:

;; package setup
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org"   . "http://orgmode.org/elpa/")))
(package-initialize)

;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t)
  (setq use-package-verbose nil)
  (setq use-package-compute-statistics t))

(use-package use-package-ensure-system-package)
(use-package auto-package-update
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-interval 30)
  (auto-package-update-hide-results nil))
(use-package use-package-chords
  :custom (key-chord-mode 1))

(use-package gnu-elpa-keyring-update)
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Emacs setup
(use-package emacs
  :custom
  (user-full-name "Iulian Costan")
  (user-login-name "icostan")
  (line-number-mode t "show line number in mode line")
  (column-number-mode t "show column number in mode line")
  (display-line-numbers-type 'relative "relative line number in fringe")
  (custom-file null-device "Don't store customization")
  (truncate-lines nil)
  (truncate-partial-width-windows nil)
  (indent-tabs-mode nil)
  (tab-width 4)
  (inhibit-splash-screen t)
  (inhibit-startup-message t)
  (visible-bell t)
  (menu-bar-mode nil)
  (tooltip-mode nil)
  (scroll-bar-mode nil)
  (tool-bar-mode nil)
  (make-backup-files nil "stop creating backup~ files")
  (auto-save-default nil "stop creating #autosave# files")
  (initial-frame-alist '((height . 24)
                         (width . 80)))
  (default-frame-alist '((font . "Source Code Pro-7:bold")))
  :custom-face
  (default ((t (nil :font "Source Code Pro-7:bold"))))
  ;; "Monospace-7
  ;; "Source Code Pro-7"
  ;; "Monaco-7"
  ;; "Consolas-7"
  ;; "Inconsolata-8"
  ;; "Anonymous Pro-8"
  ;; "DejaVu Sans Mono-7"
  ;; "xos4 Terminus"
  ;; "Source Code Pro-7:bold"
  ;; "Bitstream Vera Sans Mono-7:style=Roman"
  :config
  (global-display-line-numbers-mode t))

;; TODO make it declarative
;; y/n instead of yes/no
;; (defalias 'yes-or-no-p 'y-or-n-p)
;; Minimal UI in terminal as well
;; (if (fboundp 'scroll-bar-mode)
;;     (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode)
;;     (tool-bar-mode -1))

;; Evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-escape
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))
(use-package evil-unimpaired
  :load-path "lisp"
  :config
  (evil-unimpaired-mode))
(use-package evil-nerd-commenter
  ;; :general
  ;; (general-nmap ", l" '(nil :wk "unused comments"))
  :config
  (evilnc-default-hotkeys))
;; (use-package evil-commentary
;;   :config
;;   (evil-commentary-mode))
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
  :config
  (evil-collection-init))

;; Themes
;; (use-package monokai-theme
;;   :custom
;;   (monokai-foreground     "#F8F8FF")
;;   (monokai-comments       "#75715E")
;;   :config
;;   (load-theme 'monokai t))
;; (use-package ayu-theme
;;   :config (load-theme 'ayu-grey t))
(use-package darkokai-theme
  :custom (darkokai-mode-line-padding 1)
  :config (load-theme 'darkokai t))

;; Helm
(use-package helm
  :init
  (setq helm-M-x-fuzzy-match t
        helm-completion-style :helm-fuzzy
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-locate-fuzzy-match t
        helm-semantic-fuzzy-match t
        helm-imenu-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-candidate-number-list 150
        helm-split-window-inside-p t
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
(defun vanilla/insert-task ()
  (interactive)
  (progn
    (end-of-line)
    (newline))
  (yas-expand-snippet (yas-lookup-snippet "task")))
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
           "at"  '(eshell :wk "terminal")
           ;; Buffers
           "b"   '(nil :wk "buffers")
           "bb"  '(helm-buffers-list :wk "all")
           "bp"  '(helm-projectile-switch-to-buffer :wk "project")
           "bd"  '(kill-this-buffer :wk "kill this")
           "bD"  '(kill-buffer :wk "kill any")
           "bs"  '(save-buffer :wk "save")
           "be"  '(eval-buffer :wk "eval")
           "bf"  '(format-all-buffer :wk "format")
           "bg"  '(nil :wk "goto")
           "bgd"  '(vanilla/buffers-dashboard :wk "dashboard")
           "bgm"  '(view-echo-area-messages :wk "messages")
           ;; Comments/compile
           "c"   '(nil :wk "comments/compile")
           ;; "cc"  '(evilnc-copy-and-comment-lines :wk "copy")
           ;; "ci"  '(evilnc-comment-or-uncomment-lines :wk "lines")
           ;; "cp"  '(evilnc-comment-or-uncomment-paragraphs :wk "paragraphs")
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
           "er"  '(package-refresh-contents :wk "refresh packages")
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
           "hdf"  '(helpful-callable :wk "function or macro")
           ;; "hdf"  '(helpful-function :wk "function only")
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
           "ic"   '(insert-char :wk "char")
           "it"   '(vanilla/insert-task :wk "task")
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
           "oE"  '(org-edit-special :wk "edit block")
           "oA"  '(org-babel-execute-maybe :wk "execute all")
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
           "on"  '(org-next-visible-heading :wk "next heading")
           "oN"  '(org-babel-next-src-block :wk "next block")
           "ol"  '(org-insert-link :wk "link")
           "oI"  '(org-toggle-inline-images :wk "toggle images")
           "oh"  '(org-preview-html-mode :wk "html preview")
           "ou"  '(org-move-subtree-up :wk "move up")
           "od"  '(org-move-subtree-down :wk "move down")
           "ox"  '(org-ctrl-c-ctrl-c :wk "execute")
           "ob"  '(org-dblock-update :wk "block")
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
           "Sc"   '(flyspell-correct-wrapper :wk "flyspell-correct")
           "Sw"   '(flyspell-correct-at-point :wk "flyspell-correct word")
           "Sb"   '(flyspell-buffer :wk "flyspell buffer")
           "St"   '(flyspell-mode :wk "flyspell toggle")
           "SB"   '(ispell-buffer :wk "ispell buffer")
           "Sg"   '(writegood-grade-level :wk "writegood grade")
           "Se"   '(writegood-reading-ease :wk "writegood ease")
           "Sr"   '(synosaurus-lookup :wk "synonyms lookup")
           "Sl"   '(xah-lookup-word-definition :wk "dictionary lookup")
           ;; "ss"  '(lsp-ui-find-workspace-symbol :wk "symbols")
           "sS"  '(lsp-ui-peek-find-workspace-symbol :wk "symbols (peek)")
           "sg"  '(find-grep :wk "with grep")
           ;; Treemacs
           ;; "t"   '(nil :wk "treemacs")
           ;; "ts"  '(sort-lines :wk "sort line")
           ;; "te"  '(lsp-treemacs-errors-list :wk "errors")
           ;; "tr"  '(lsp-treemacs-references :wk "references")
           ;; "ts"  '(lsp-treemacs-symbols :wk "symbols")
           ;; "tt"  '(treemacs :wk "treemacs")
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
           "wo"  '(scroll-other-window :wk "scroll other")
           ;; "ww"  '(other-window :wk "next window")
           "wg"  '(golden-ratio-toggle-widescreen :wk "golden ratio")
           "ws"  '(ace-swap-window :wk "swap")
           ;; Quit
           "q"  '(nil :wk "quit")
           "qr" '(restart-emacs :wk "restart emacs")
           "qq" '(kill-emacs :wk "quit emacs")
           "qm" '(make-frame :wk "make frame")
           "qd" '(delete-frame :wk "delete frame")
           "qf" '(toggle-frame-fullscreen :wk "fullscreen")))

;; Projectile
(use-package projectile
  :config
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

;; Code Snippets
(use-package yasnippet
  :config (yas-global-mode 1))
(use-package yasnippet-snippets
  :after yasnippet)

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;; Programming/markup/etc languages
(use-package asm :load-path "langs")
(use-package emacs-lisp :load-path "langs")
(use-package elixir :load-path "langs")
(use-package orgmode :load-path "langs")
(use-package go :load-path "langs")
(use-package pine :load-path "langs")
(use-package python-lang :load-path "~/Projects/emacs.d/langs")
(use-package ruby :load-path "langs")
(use-package rust :load-path "langs")
(use-package yaml :load-path "langs")
(use-package html :load-path "langs")
(use-package sage :load-path "langs")
(use-package json :load-path "langs")
(use-package solidity :load-path "langs")
(use-package vyper :load-path "langs")
(use-package configs :load-path "langs")
(use-package all :load-path "langs")

;; Company mode for Completion
(use-package company
  :defer t
  :diminish company-mode
  :init (global-company-mode))
(use-package company-quickhelp
  :after company
  :init
  (company-quickhelp-mode))

;; Git init
(use-package git)

;; Show matching parens
(use-package paren
  :custom
  (show-paren-delay 0)
  (show-paren-mode 1))


;; Move
(use-package ace-jump-mode
  :general
  (general-nmap "g l" '(ace-jump-line-mode :wk "to line")
    "g w" '(ace-jump-word-mode :wk "to word")
    "g W" '(evil-fill :wk "evil-fill (unbound w)")))
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
  :after (evil ledger-mode)
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

;; Language Server Protocol
(use-package lsp-mode
  :general
  (general-nmap ", f" '(lsp-format-buffer :wk "format")
    ", o" '(switch-to-buffer("*ruby-ls*") :wk "output"))
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (python-mode . lsp)
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
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
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

;; CI
(use-package travis)

;; Trees init
;; (use-package trees)

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
  :ensure-system-package (wakatime)
  :init
  (setq wakatime-api-key "978b706c-dcd2-4d83-955b-25ed115813b9")
  ;; (setq wakatime-api-key (getenv "WAKATIME_KEY"))
  :config
  (global-wakatime-mode))

;; enable electric parens
(use-package elec-pair
  :config
  (electric-pair-mode))

;; Spell checking / Writing
(use-package flyspell
  :config
  (flyspell-mode))
(use-package flyspell-correct)
;; (use-package flycheck-aspell
;;   :after flycheck
;;   :load-path "~/Projects/emacs.d/lisp"
;;   :config
;;   (add-to-list 'flycheck-checkers 'tex-aspell-dynamic))
(use-package writegood-mode)
(use-package synosaurus
  :ensure-system-package (wn . wordnet-cli)
  ;; :custom
  ;; (synosaurus-choose-method 'default)
  :config
  (synosaurus-mode))
(use-package xah-lookup
  :init
  (setq xah-lookup-browser-function 'eww))

;; numbers
;; (use-package highlight-numbers
;;   :hook (prog-mode . highlight-numbers-mode))

;;; Lorem
(use-package lorem-ipsum)

;;; Call graph
(use-package ggtags)
;; (use-package call-graph
;;   :after ggtags)

;; Help
(use-package helpful)
(use-package info-colors
  :hook
  (Info-selection #'info-colors-fontify-node))

(use-package counsel)
(use-package minimap
  :config
  (setq minimap-width-fraction 0.1))

;;; devdocs
(use-package devdocs)

;; completion framework
(use-package ivy
  ;; :custom
  ;; (ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  ;; (ivy-count-format "%d/%d " "Show anzu-like counter")
  ;; (ivy-use-selectable-prompt t "Make the prompt line selectable")
  ;; :custom-face
  ;; (ivy-current-match ((t (:inherit 'hl-line))))
  :config
  (ivy-mode t))

;;; Searching
(use-package rg
  :defer t
  :ensure-system-package (rg . ripgrep))
(use-package ag
  :defer t
  :ensure-system-package (ag . the_silger_searcher)
  :custom
  (ag-highlight-search t "Highlight the current search term."))
(use-package dumb-jump
  :general
  (general-nmap "g D" '(dumb-jump-go :wk "dumb-goto-definition"))
  :defer t
  :custom
  (dumb-jump-selector 'helm)
  (dumb-jump-prefer-searcher 'ag))

;; build status
(use-package build-status)

;; All Done!!!
(message "==> ALL DONE, %s." (user-login-name))

(provide 'init)

;;; init.el ends here
