;;; keybindings-general.el --- Keybindings with General
;;; Commentary:
;;; Code:

(use-package vanilla :load-path "init")
(use-package general
  :init (general-evil-setup)
  :config (general-define-key
           :states '(normal visual insert)
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
           "bp"  '(projectile-switch-to-buffer :wk "in project")
           "bP"  '(projectile-switch-to-buffer-other-window :wk "in project other window")
           "bd"  '(kill-this-buffer :wk "kill this")
           "bD"  '(kill-buffer :wk "kill any")
           "bs"  '(save-buffer :wk "save")
           "be"  '(eval-buffer :wk "eval")
           "bf"  '(format-all-buffer :wk "format")
           "br"  '(revert-buffer :which-key "revert buffer")
           "ba"  '(view-echo-area-messages :wk "messages")
           "bC" '((lambda () (interactive) (switch-to-buffer "*Compile-Log*")) :which-key "Compile log-buffer")
           "bD" '((lambda () (interactive) (switch-to-buffer "*dashboard*")) :which-key "dashboard-buffer")
           "bm" '((lambda () (interactive) (switch-to-buffer "*Messages*")) :which-key "messages-buffer")
           "bs" '((lambda () (interactive) (switch-to-buffer "*scratch*")) :which-key "scratch-buffer")
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
           "ddg"  '(vanilla-disaster-with-gcc :wk "with gcc")
           "ddc"  '(vanilla-disaster-with-clang :wk "with clang")
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
           "ff"  '(find-file :wk "find file (default)")
           "fF"  '(find-file-other-window :wk "file in other window")
           "fG"  '(helm-locate :wk "file/directory globally")
           "fP"  '(helm-projectile-find-file-in-known-projects :wk "file in known projects")
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
           "hw" '((lambda () (interactive) (progn (which-key-mode)(which-key-posframe-mode))) :which-key "Toggle which-key-mode")
           "hh"  '(which-key-show-top-level :wk "root")
           "hk"  '(which-key-show-keymap :wk "keymap")
           "hm"  '(which-key-show-full-major-mode :wk "keymap")
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
           "hdm"  '(describe-mode :wk "mode")
           "hdk"  '(helpful-key :wk "key")
           "hdK"  '(counsel-describe-map :wk "keymap")
           "hdb"  '(counsel-descbinds :wk "bindings")
           "hda"  '(counsel-describe-face :wk "face")
           "hdF"  '(describe-font :wk "font")
           "hdt"  '(describe-theme :wk "theme")
           "hdp"  '(describe-package :wk "package")
           "hdC"  '(describe-char :wk "char")
           "hdG"  '(general-describe-keybindings :wk "General")
           "hdP"  '(describe-personal-keybindings :wk "Personal")
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
           "it"   '(vanilla-insert-task :wk "task")
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
           "pf"  '(projectile-find-file :wk "find files")
           "pF"  '(projectile-find-file-other-window :wk "find files other window")
           "po"  '(projectile-find-other-file :wk "find extension")
           "pp"  '(projectile-switch-project :wk "switch project")
           "pt"  '(vanilla-projectile-goto-todos :wk "todos")
           "pb"  '(projectile-switch-to-buffer :wk "switch buffer")
           "pB"  '(projectile-switch-to-buffer-other-window :wk "switch buffer other window")
           "pr"  '(projectile-project-root :wk "root")
           ;; Replace
           "r"   '(nil :wk "replace")
           "rr"  '(query-replace :wk "default (in file)")
           "rf"  '(query-replace :wk "in file")
           "rp"  '(helm-projectile-ag :wk "in project")
           ;; Recording
           "R"   '(nil :wk "record")
           "Rv"  '(vanilla-record-video :wk "video cast")

           "Rc"  '(camcorder-convert-to-gif :wk "convert video-to-gif")
           "Rg"  '(vanilla-record-gif :wk "gif cast")
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
           "t"   '(:ignore t :wk "treemacs")
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

(message "==> INIT: keybindings-general.el")

(provide 'keybindings-general)

;;; keybindings-general.el ends here
