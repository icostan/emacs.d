;;; keybindings-general.el --- Keybindings with General
;;; Commentary:
;;; Code:

(use-package vanilla :load-path "init")
(use-package general
  :after evil
  :init
  (general-evil-setup)
  :config
  (general-create-definer icostan/leader-keys
    :states '(normal insert visual motion emacs)
    :keymaps 'override
	:prefix "SPC"
	:non-normal-prefix "C-SPC")

  (icostan/leader-keys
    "/"   '(consult-ripgrep :wk "ripgrep") ; You'll need counsel package for this
    "TAB" '(switch-to-prev-buffer :wk "previous buffer")
    "SPC" '(execute-extended-command :wk "M-x")

    ;; Apps
    "a"   '(nil :wk "apps")
    "aa"  '(ollama-buddy-menu :wk "ollama-buddy")
    "at"  '(eshell :wk "terminal")

    ;; Buffers
    "b"   '(nil :wk "buffers")
    "bb"  '(switch-to-buffer :wk "to buffer (default)")
    "bp"  '(projectile-switch-to-buffer :wk "in project")
    "bP"  '(projectile-switch-to-buffer-other-window :wk "in project other window")
    "bd"  '(kill-this-buffer :wk "kill this")
    "bD"  '(icostan/kill-other-buffer :wk "kill other")
    "bs"  '(save-buffer :wk "save")
    "be"  '(eval-buffer :wk "eval")
    "bf"  '(format-all-buffer :wk "format")
    "br"  '(revert-buffer :which-key "revert buffer")
    "bc" '((lambda () (interactive) (switch-to-buffer "*Compile-Log*")) :which-key "compile log-buffer")
    ;; "bD" '((lambda () (interactive) (switch-to-buffer "*dashboard*")) :which-key "dashboard-buffer")
    "bm" '((lambda () (interactive) (switch-to-buffer "*Messages*")) :which-key "messages-buffer")
    "bs" '((lambda () (interactive) (switch-to-buffer "*scratch*")) :which-key "scratch-buffer")
    "bw" '((lambda () (interactive) (switch-to-buffer "*Warnings*")) :which-key "warnings-buffer")

    ;; Comments/compile
    "c"   '(nil :wk "compile")
    "cc"  '(compile :wk "compile")

           ;; Debug
           "d"   '(nil :wk "debug")
           "dp"  '(dap-debug :wk "dap")
           "de"  '(edebug-defun :wk "edebug-defun")
           "dd"  '(nil :wk "disassembly")
           "ddg"  '(vanilla-disaster-with-gcc :wk "with gcc")
           "ddc"  '(vanilla-disaster-with-clang :wk "with clang")
           "dh"  '(hexl-find-file :wk "file in HEX")
           "dt"  '(hexl-find-file :wk "file in HEX")

           ;; Emacs
           "E"   '(nil :wk "emacs")
           "Ee"  '(eval-last-sexp :wk "eval sexp (default)")
           "EE"  '(eval-print-last-sexp :wk "eval sexp print")
           "Er"  '(package-refresh-contents :wk "refresh packages")
           "El"  '(package-list-packages :wk "list packages")
           "Ea"  '(package-autoremove :wk "autoremove packages")
           "Eu"  '(auto-package-update-now :wk "update now")
           "Ed"  '(eval-defun :wk "eval defun")
           "Eb"  '(backward-up-list :wk "backward up")
           "Et"  '(toggle-debug-on-error :wk "toggle debug on error")
           "Ei"  '(indent-pp-sexp :wk "indent sexp")
           "Ev"  '(exec-path-from-shell-copy-env :wk "copy env")

           "e"   '(nil :wk "editing")
           "es"  '(sort-lines :wk "sort lines")
           "ef"   '(nil :wk "fly+")
           "efc"  '(flycheck-list-errors :wk "+check errors")
           "efm"  '(flymake-show-project-diagnostics :wk "+make project")
           "efM"  '(consult-flymake :wk "+make consult")

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
           "jc"  '(ace-jump-char-mode :wk "to char")
           "jw"  '(ace-jump-word-mode :wk "to word")
           "jl"  '(ace-jump-line-mode :wk "to line")
           "jd"  '(lsp-find-declaration :wk "to declaration")
           "jD"  '(lsp-goto-type-definition :wk "to definition")
           "ji"  '(lsp-goto-implementation :wk "to implementation")

           ;; Org
           "o"   '(nil :wk "org")
           "oe"  '(org-babel-execute-src-block :wk "execute block")
           "oE"  '(org-edit-special :wk "edit block")
           "oA"  '(org-babel-execute-maybe :wk "execute all")
           "oT"  '(org-babel-tangle :wk "Tangle blocks")
           "oS"  '(org-tanglesync-process-buffer-automatic :wk "tangle Sync")
           "ot"  '(org-todo :wk "todo")
           "oj"  '(org-journal-new-entry :wk "new journal entry")
           ;; "oC"  '(org-capture :wk "capture")
           "oC"  '(nil :wk "columns")
           "oCt"  '(org-columns :wk "toggle")
           "oCr"  '(org-columns-redo :wk "update columns")
           "oCu"  '(org-dblock-update :wk "update block")
           "oc"  '(org-toggle-checkbox :wk "checkbox")
           "oa"  '(org-agenda-list :wk "agenda")
           "og"  '(org-set-tags-command :wk "tag")
           "op"  '(org-priority :wk "priority")
           "oP"  '(org-toggle-pretty-entities :wk "toggle Pretty")
           "o>"  '(org-demote-subtree :wk "demote")
           "o<"  '(org-promote-subtree :wk "promote")
           "os"  '(org-schedule :wk "schedule")
           "oi"  '(org-insert-structure-template :wk "insert")
           "on"  '(org-next-visible-heading :wk "next heading")
           "oN"  '(org-babel-next-src-block :wk "next block")
           "ol"  '(org-insert-link :wk "link")
           "oL"  '(org-latex-preview :wk "toggle LaTeX")
           "oI"  '(org-toggle-inline-images :wk "toggle Images")
           "oh"  '(org-preview-html-mode :wk "html preview")
           "ou"  '(org-move-subtree-up :wk "move up")
           "od"  '(org-move-subtree-down :wk "move down")
           "ox"  '(org-ctrl-c-ctrl-c :wk "execute C-c C-c")
           "ob"  '(org-dblock-update :wk "block")

           ;; Replace
           "r"   '(nil :wk "replace")
           "rf"  '(query-replace :wk "in file")
           "rp"  '(projectile-ripgrep :wk "in project")

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
           "qQ" '(kill-emacs :wk "quit emacs")
           "qm" '(make-frame :wk "make frame")
           "qd" '(delete-frame :wk "delete frame")
           "qf" '(toggle-frame-fullscreen :wk "fullscreen")))

(message "==> INIT: keybindings-general.el")

(provide 'keybindings-general)

;;; keybindings-general.el ends here
