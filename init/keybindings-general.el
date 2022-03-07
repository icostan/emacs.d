;;; keybindings-general.el --- Keybindings with General
;;; Commentary:
;;; Code:

(use-package vanilla :load-path "init")
(use-package general
  :init
  (general-evil-setup)
  :config
  (general-create-definer icostan/leader-keys
	:prefix "SPC"
	:non-normal-prefix "C-SPC")

  (icostan/leader-keys
    :states '(normal visual motion)
    :keymaps 'override
    "/"   '(consult-ripgrep :wk "ripgrep") ; You'll need counsel package for this
    ;; "/"   '(counsel-rg :wk "ripgrep") ; You'll need counsel package for this
    "TAB" '(switch-to-prev-buffer :wk "previous buffer")
    "SPC" '(execute-extended-command :wk "M-x")
    ;; "SPC" '(helm-M-x :wk "M-x")

    ;; Apps
    "a"   '(nil :wk "apps")
    "at"  '(eshell :wk "terminal")

    ;; Buffers
    "b"   '(nil :wk "buffers")
    "bb"  '(switch-to-buffer :wk "to buffer (default)")
    ;; "bb"  '(helm-buffers-list :wk "all")
    "bp"  '(projectile-switch-to-buffer :wk "in project")
    "bP"  '(projectile-switch-to-buffer-other-window :wk "in project other window")
    "bd"  '(kill-this-buffer :wk "kill this")
    "bD"  '(kill-buffer :wk "kill any")
    "bs"  '(save-buffer :wk "save")
    "be"  '(eval-buffer :wk "eval")
    "bf"  '(format-all-buffer :wk "format")
    "br"  '(revert-buffer :which-key "revert buffer")
    "bc" '((lambda () (interactive) (switch-to-buffer "*Compile-Log*")) :which-key "compile log-buffer")
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
           "ee"  '(eval-last-sexp :wk "eval sexp (default)")
           "eE"  '(eval-print-last-sexp :wk "eval sexp print")
           "er"  '(package-refresh-contents :wk "refresh packages")
           "eu"  '(auto-package-update-now :wk "update now")
           "ed"  '(eval-defun :wk "eval defun")
           "eb"  '(backward-up-list :wk "backward up")
           "ei"  '(indent-pp-sexp :wk "indent sexp")
           "E"   '(nil :wk "editing")
           "Es"  '(sort-lines :wk "sort lines")
           "Ef"   '(nil :wk "fly+")
           "Efc"  '(flycheck-list-errors :wk "+check errors")
           "Efm"  '(flymake-show-project-diagnostics :wk "+make errors")

           ;; Files
           "f"   '(nil :wk "files")
           "ff"  '(find-file :wk "find file (default)")
           "fF"  '(find-file-other-window :wk "file in other window")
           "fG"  '(helm-locate :wk "file/directory globally")
           "fP"  '(helm-projectile-find-file-in-known-projects :wk "file in known projects")
           "fj"  '(dired-jump :wk "find current directory")
           "fd"  '(helm-projectile-find-dir :wk "find directory in project")
           "fs"  '(save-buffer :wk "save file")

           ;; Help
           "h"   '(nil :wk "help")
           "hh"  '(helpful-at-point :wk "at point (default)")
           "hw"  '(nil :wk "which-key")
           "hwt" '((lambda () (interactive) (progn (which-key-mode)(which-key-posframe-mode))) :which-key "toggle on/off")
           "hwr"  '(which-key-show-top-level :wk "root")
           "hwk"  '(which-key-show-keymap :wk "keymap")
           "hwM"  '(which-key-show-full-major-mode :wk "major mode")
           ;; "hwM"  '(which-key-show-major-mode :wk "major mode")
           "hwm"  '(which-key-show-full-minor-mode-keymap :wk "minor mode")
           ;; "hwm"  '(which-key-show-minor-mode-keymap :wk "minor mode")
           "hs"  '(use-package-report :wk "use-package report")
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
           "hdK"  '(counsel-describe-map :wk "keymap")
           "hdb"  '(counsel-descbinds :wk "bindings")
           "hda"  '(describe-face :wk "face")
           ;; "hda"  '(counsel-describe-face :wk "face")
           "hdF"  '(describe-font :wk "font")
           "hds"  '(repeat-complex-command :wk "smart")
           "hdt"  '(describe-theme :wk "theme")
           "hdp"  '(describe-package :wk "package")
           "hdC"  '(describe-char :wk "char")
           "hdG"  '(general-describe-keybindings :wk "general")
           "hdP"  '(describe-personal-keybindings :wk "personal")
           "hi"  '(info :wk "info")
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
           "jj"  '(consult-imenu :wk "default (in buffer)")
           "jJ"  '(consult-imenu-multi :wk "default (in all)")
           ;; "jj"  '(helm-lsp-workspace-symbol :wk "default (to symbol)")
           ;; "jf"  '(helm-semantic-or-imenu :wk "function in file")
           ;; "jF"  '(helm-imenu-in-all-buffers :wk "function in buffers")
           "jc"  '(ace-jump-char-mode :wk "to char")
           "jw"  '(ace-jump-word-mode :wk "to word")
           "jl"  '(ace-jump-line-mode :wk "to line")
           "jd"  '(lsp-find-declaration :wk "to declaration")
           "jD"  '(lsp-goto-type-definition :wk "to definition")
           "ji"  '(lsp-goto-implementation :wk "to implementation")
           "js"  '(helm-lsp-workspace-symbol :wk "to symbol")
           "jS"  '(helm-lsp-global-workspace-symbol :wk "to all symbols")

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
           "ss"  '(consult-line :wk "in buffer (default)")
           "sS"  '(consult-line-multi :wk "in all buffers")
           ;; "ss"  '(helm-swoop :wk "default (in file)")
           ;; "sf"  '(helm-swoop :wk "in file")
           "sB"  '(helm-multi-swoop-all :wk "in all buffers")
           "sb"  '(helm-multi-swoop-projectile :wk "in project buffers")
           "sm"  '(helm-multi-swoop-current-mode :wk "in mode buffers")
           "so"  '(helm-multi-swoop-org :wk "in org buffers")
           "sd"  '(helm-do-grep-ag :wk "in directory")
           "sP"  '(helm-do-pdfgrep-1 :wk "in PDFs")
           "sp"  '(helm-projectile-ag :wk "in project")
           "sr"  '(lsp-find-references :wk "references")
           "sR"  '(lsp-ui-peek-find-references :wk "references (peek)")

           ;; Treemacs
           "t"   '(:ignore t :wk "treemacs")
           "te"  '(lsp-treemacs-errors-list :wk "errors")
           "tr"  '(lsp-treemacs-references :wk "references")
           "ts"  '(lsp-treemacs-symbols :wk "symbols")
           "tt"  '(treemacs :wk "treemacs")

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
