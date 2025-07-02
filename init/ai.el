;;; ai.el --- AI
;;; Commentary:
;;; Code:

;; https://github.com/karthink/gptel
;; https://www.reddit.com/r/emacs/comments/1i0vsz9/tech_demo_completing_functions_using_gptel/?rdt=33694
(use-package gptel
  :config
  (gptel-make-openai "llava"          ;Any name
    :stream t                             ;Stream responses
    :protocol "http"
    :host "192.168.1.6:8080"                ;Llama.cpp server location
    :models '("default"))                    ;Any names, doesn't matter for Llama
  :custom
  (gptel-log-level 'debug)
  :general
  (icostan/leader-keys
    ";"  '(gptel-send :wk "gptel-send")
    "'"  '(gptel-menu :wk "gptel-menu")))

(use-package uuid)

;; (use-package gptel-proof
;;   :load-path "lisp")

;; https://emacs.dyerdwelling.family/emacs/20250207092636-emacs--ollama-buddy-local-llm-integration-for-emacs/
(use-package ollama-buddy
  :ensure t
  :custom
  (ollama-buddy-host "localhost")
  ;; (ollama-buddy-port 11434)
  :bind ("C-c o" . ollama-buddy-menu))

(use-package claude-code-ide
  :straight (:type git :host github :repo "manzaltu/claude-code-ide.el"))

;; (use-package greger
;;   :ensure t
;;   :bind ("C-M-;" . greger))

;; https://github.com/sunflowerseastar/ob-llm

;; (use-package goose
;;   :load-path "/path/to/goose.el"
;;   :hook (goose-mode-hook . (lambda ()
;;                              (display-line-numbers-mode -1)))
;;   :bind (("C-c g" . goose-transient)))

;; https://www.reddit.com/r/emacs/comments/1i4e642/minuetaiel_code_completion_using_openai_claude/
;; https://github.com/milanglacier/minuet-ai.el

;; https://github.com/dolmens/gptel-aibo

;; https://github.com/copilot-emacs/copilot.el

;; https://github.com/AnselmC/le-gpt.el

(provide 'ai)

;;; ai.el ends here
