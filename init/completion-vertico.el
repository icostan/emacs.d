;;; completion-vertico.el --- Completion with Vertico
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

  ;; Show more candidates
  (vertico-count 20)
  :config
  (vertico-mode))

(use-package vertico-posframe
  :quelpa (:fetcher github :repo "tumashu/vertico-posframe")
  :custom
  (vertico-posframe-parameters '((left-fringe . 8)
                                 (right-fringe . 8)
                                 (weight . 50)))
  :config
  (vertico-posframe-mode))

(use-package marginalia
  :bind
  (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package all-the-icons-completion
  :after marginalia
  :hook
  (marginalia-mode . all-the-icons-completion-marginalia-setup))
  ;; :config
  ;; (all-the-icons-completion-mode))

(use-package consult
  :bind
  ("C-c l" . consult-line)
  ("C-c s" . consult-ripgrep)
  ("C-c b" . consult-buffer))

(provide 'completion-vertico)

;;; completion-vertico.el ends here
