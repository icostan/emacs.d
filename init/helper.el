;;; helper.el --- A better help
;;; Commentary:
;;; Code:

(use-package helpful
  :custom
  (helpful-max-highlight 10000)
  :general
  (icostan/leader-keys
    "h"   '(nil :wk "help")
    "hh"  '(helpful-at-point :wk "at point (default)")

    "ht"  '(which-key-show-top-level :wk "root")
    "hk"  '(which-key-show-keymap :wk "keymap")
    "hM"  '(which-key-show-major-mode :wk "major mode")
    "hm"  '(which-key-show-minor-mode-keymap :wk "minor mode")

    "ha"  '(nil :wk "apropos")
    "haa"  '(apropos :wk "apropos (default)")
    "haw"  '(apropos-all-words :wk "all")
    "hac"  '(apropos-command :wk "command")
    "haf"  '(apropos-function :wk "function")
    "hav"  '(apropos-variable :wk "variable")

    "hd"  '(nil :wk "describe")
    "hdd"  '(helpful-at-point :wk "token at point")
    "hdv"  '(helpful-variable :wk "variable")
    "hdc"  '(helpful-command :wk "command")
    "hdf"  '(helpful-callable :wk "function or macro")
    "hdM"  '(helpful-macro :wk "macro")
    "hdm"  '(describe-mode :wk "mode")
    "hdk"  '(helpful-key :wk "key")
    "hdK"  '(describe-keymap :wk "keymap")
    "hdb"  '(describe-bindings :wk "bindings")
    "hda"  '(describe-face :wk "face")
    "hdF"  '(describe-font :wk "font")
    "hds"  '(repeat-complex-command :wk "smart")
    "hdt"  '(describe-theme :wk "theme")
    "hdp"  '(describe-package :wk "package")
    "hdC"  '(describe-char :wk "char")
    "hdG"  '(general-describe-keybindings :wk "general")
    "hdP"  '(describe-personal-keybindings :wk "personal")

    "hi"  '(info :wk "info")
    "he"  '(view-echo-area-messages :wk "view echo")
    "hs"  '(use-package-report :wk "use-package report")
    "hg"  '(shortdoc-display-group :wk "shortdoc group")
    "ho"  '(nil :wk "online")
    "hod"  '(devdocs-search :wk "devdocs")))

(use-package info-colors
  :hook
  (Info-selection #'info-colors-fontify-node))

(use-package devdocs)

;; g C-h - help keybinding prefix

(use-package which-key
  :bind
  ("C-c m" . which-key-show-minor-mode-keymap)
  ("C-c M" . which-key-show-major-mode)
  ("C-c t" . which-key-show-top-level)
  :diminish which-key-mode
  :custom
  (which-key-sort-order 'which-key-key-order-alpha)
  (which-key-idle-delay 0.5)
  (which-key-min-display-lines 30)
  (which-key-max-description-length 166)
  (which-key-show-docstrings nil)
  :config
  (which-key-add-key-based-replacements
    ", c" "comment"
    ", l" "comment (duplicated)"
    "C-c ," "semantic/senator"
    "C-c &" "yas"
    "C-c C-x" "edebug"
    "C-c !" "flycheck")
  (which-key-mode))

(use-package which-key-posframe
  :custom
  (which-key-posframe-border-width 2)
  :config
  (which-key-posframe-mode))

(use-package dash-docs)
(use-package consult-dash
  :quelpa (consult-dash :fetcher git :url "https://codeberg.org/ravi/consult-dash.git")
  :bind (("M-s d" . consult-dash))
  :config
  ;; Use the symbol at point as initial search term
  (consult-customize consult-dash :initial (thing-at-point 'symbol))
  ;; Ensure that niceties are loaded too
  ;; (require 'embark)
  (require 'marginalia))

;;; TODO: try https://github.com/abo-abo/hydra, https://github.com/wurosh/hercules

(message "==> INIT: helper.el")

(provide 'helper)

;;; helper.el ends here
