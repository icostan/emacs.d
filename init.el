;;; init.el --- Init file -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Iulian Costan

;; Author: Iulian Costan
;; Keywords: lisp dotemacs init
;; URL: https://github.com/icostan/emacs.d
;; Package-Version: 1.0
;; Package-Requires: ((emacs "29.1"))

;; SPDX-License-Identifier: MIT

;;; Commentary:
;; Emacs configuration

;;; Code:

;; build-in package setup
(message "")
(message "==> INIT: START, %s." (user-login-name))

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
  '
  (("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(message "==> INIT: packages.el")

;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package)
  (require 'use-package-ensure)
  (setq use-package-always-ensure t)
  (setq use-package-verbose nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-compute-statistics t))

;; (use-package use-package-ensure-system-package)
(use-package
  auto-package-update
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-interval 30)
  (auto-package-update-hide-results nil))
(use-package use-package-chords :custom (key-chord-mode 1))
(use-package diminish)

(use-package gnu-elpa-keyring-update)
(use-package
  exec-path-from-shell
  :config (exec-path-from-shell-initialize))
(message "==> INIT: use-package")

;; quelpa setup
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)
(message "==> INIT: quelpa")

;; straight setup
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(message "==> INIT: straight")

;; emacs setup
(use-package
  emacs
  :custom
  (user-full-name "Iulian Costan")
  (user-login-name "icostan")
  (x-alt-keysym 'meta "Use ALT as Meta key, instead of default ESC")
  (line-number-mode t "Show line number in mode line")
  (column-number-mode t "Show column number in mode line")
  (display-line-numbers-type
    'relative
    "Relative line number in fringe")
  (custom-file null-device "Don't store customization")
  (truncate-lines nil)
  (truncate-partial-width-windows nil)
  (indent-tabs-mode nil)
  (indicate-empty-lines t)
  (indicate-unused-lines t)
  (show-trailing-whitespace t)
  (hl-line-mode t)
  (highlight-indent-guides-mode t)
  (electric-pair-mode t)
  (semantic-mode t)
  (tab-width 4)
  (inhibit-splash-screen t)
  (inhibit-startup-message t)
  (visible-bell t)
  (menu-bar-mode nil "Non-nil shows the menubar")
  (tooltip-mode nil "Non-nil shows the tooltip")
  (scroll-bar-mode nil "Non-nil shows the scrollbar")
  (tool-bar-mode nil "Non-nil shows the toolbar")
  (make-backup-files nil)
  (auto-save-default nil)
  (async-shell-command-buffer 'new-buffer)
  (initial-frame-alist
    '
    ((height . 24)
      (width . 80)))
  (default-frame-alist '((font . "Fira Code-6:bold")))
  :custom-face (default ((t (nil :font "Fira Code-6:bold"))))
  ;; "Source Code Pro-7"
  ;; "Monospace-7
  ;; "Monaco-7"
  ;; "Consolas-7"
  ;; "Inconsolata-8"
  ;; "Anonymous Pro-8"
  ;; "DejaVu Sans Mono-7"
  ;; "Fira Code-7"
  :config (global-display-line-numbers-mode t))
;; (use-package fira-code-mode
;;   :custom (fira-code-mode-disabled-ligatures '("[]" "|>"))
;;   :hook prog-mode)
(message "==> INIT: emacs")

(use-package themes :load-path "init")
(use-package ui :load-path "init")
(use-package math :load-path "init")
(use-package vim :load-path "init")
(use-package keybindings-general :load-path "init")
;; (use-package completion-company :load-path "init")
(use-package completion-corfu :load-path "init")
;; (use-package selection-ivy :load-path "init")
(use-package selection-vertico :load-path "init")
(use-package project-management :load-path "init")
(use-package misc :load-path "init")
(use-package git :load-path "init")
(use-package editing :load-path "init")
(use-package syntax-flycheck :load-path "init")
(use-package syntax-flymake :load-path "init")
(use-package compiling :load-path "init")
(use-package navigation :load-path "init")
(use-package presentation :load-path "init")
(use-package personal-finance :load-path "init")
;; (use-package lsp-lsp :load-path "init")
(use-package lsp-eglot :load-path "init")
(use-package searching :load-path "init")
(use-package replacing :load-path "init")
(use-package snippets :load-path "init")
(use-package spelling :load-path "init")
(use-package startup :load-path "init")
(use-package trees :load-path "init")
(use-package windows :load-path "init")
(use-package helper :load-path "init")
(use-package langs :load-path "init")
(use-package diagrams :load-path "init")
(use-package files-essentials :load-path "init")
(use-package ai :load-path "init")

(message "==> INIT: DONE, %s." (user-login-name))
(message "")

(provide 'init)

;;; init.el ends here
