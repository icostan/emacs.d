;; Config directory
(setq user-emacs-directory "~/.vanilla.d/")

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
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
;; (add-to-list 'default-frame-alist '(font . "mononoki-12"))
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
  (setq-default evil-escape-key-sequence "fd")
  :config
  (evil-escape-mode 1))

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
  (helm-mode 1)
  :bind (("C-c j f" . helm-semantic-or-imenu)))

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))

;; General keybindings
(use-package general
  :ensure t
  :config (general-define-key
           :states '(normal visual insert emacs)
           :prefix "SPC"
           :non-normal-prefix "M-SPC"
           ;; "/"   '(counsel-rg :which-key "ripgrep") ; You'll need counsel package for this
           "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
           "SPC" '(helm-M-x :which-key "M-x")
           ;; Files
           "ff"  '(helm-find-files :which-key "find files")
           "fj"  '(dired-jump :which-key "find directory")
           "fs"  '(save-buffer :which-key "save file")
           ;; Project
           "pf"  '(projectile-find-file :which-key "find files in project")
           "pp"  '(projectile-switch-project :which-key "switch project")
           ;; Buffers
           "bb"  '(helm-buffers-list :which-key "buffers list")
           "bs"  '(save-buffer :which-key "save buffer")
           ;; Windows
           "wl"  '(windmove-right :which-key "move right")
           "wh"  '(windmove-left :which-key "move left")
           "wk"  '(windmove-up :which-key "move up")
           "wj"  '(windmove-down :which-key "move bottom")
           "w/"  '(split-window-right :which-key "split right")
           "w-"  '(split-window-below :which-key "split bottom")
           "wd"  '(delete-window :which-key "delete window")
           "wx"  '(delete-other-windows :which-key "delete other window")
           "ww"  '(other-window :which-key "next window")
           ;; Others
           "at"  '(ansi-term :which-key "open terminal")
           ;; Quit
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
  :ensure t
  :init
  ;; (setq projectile-require-project-root nil)
  :bind
  ;; (("C-p p" . projectile-switch-project-action))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  ;; (define-key projectile-mode-map (kbd "SPC-p") 'projectile-command-map)
  ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1))

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
;; (use-package all-the-icons :ensure t)

;; Programming languages
(use-package ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby")

;;
;; Optional
;;

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Disable backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Move
(use-package ace-jump-mode
  :bind (("C-c m c" . ace-jump-char-mode)
         ("C-c m w" . ace-jump-word-mode)
         ("C-c m l" . ace-jump-line-mode)))
;; (use-package avy
;;   :bind (("C-c j l" . avy-goto-line)
;;          ("C-c j a" . avy-goto-char-timer))

;; Presentation
(use-package demo-it
  :config
  (use-package org-tree-slide))

;; Screencasting
(use-package camcorder
  :bind (("C-c r w" . camcorder-mode)
	 ("C-c r f" . camcorder-record)
	 ("C-c r c" . camcorder-convert-to-gif)))

(use-package command-log-mode)
