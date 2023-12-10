;;; selection-vertico.el --- Selection with Vertico
;;; Commentary:
;;; Code:

(use-package vertico
  :init
  (setq insert-default-directory t)
  :custom
  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)
  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)
  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)

  (vertico-count 25)
  :config
  (vertico-mode))

(use-package vertico-multiform
  :after vertico
  :ensure nil
  :custom
  (vertico-multiform-commands
   '(("flyspell-correct-*" grid reverse)
     (org-refile grid reverse indexed)
     (consult-yank-pop indexed)
     (consult-line
        posframe
        (vertico-posframe-poshandler . posframe-poshandler-frame-top-center)
        (vertico-posframe-border-width . 1)
        (vertico-posframe-fallback-mode . vertico-buffer-mode))
     (consult-flymake)
     (consult-lsp-diagnostics)
     (t posframe)))
  (vertico-multiform-categories
      '((file reverse)
        (consult-grep buffer)))
  :config
  (vertico-multiform-mode))

(use-package vertico-posframe
  :init (icostan/vc-install :repo "tumashu/vertico-posframe")
  :after vertico
  :custom
  (vertico-posframe-parameters '((left-fringe . 8)
                                 (right-fringe . 8)
                                 (weight . 50))))

(use-package marginalia
  :bind
  (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package all-the-icons-completion
  ;; :quelpa (:fetcher github :repo "MintSoup/all-the-icons-completion")
  :after all-the-icons
  ;; :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :config
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)
  (all-the-icons-completion-mode))

(use-package consult
  :bind
  ("C-c l" . consult-line)
  ("C-c s" . consult-ripgrep)
  ("C-c b" . consult-buffer))

(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("FIXME"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("SMELL"  . "#FF4500")
        ("STUB"   . "#1E90FF"))))
(use-package consult-todo
  :after consult hl-todo)

(use-package embark
  :ensure t
  :bind
  (("C-," . embark-act)         ;; pick some comfortable binding
   ("C-." . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(message "==> INIT: selection-vertico.el")

(provide 'selection-vertico)

;;; selection-vertico.el ends here
