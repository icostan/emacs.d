;;; completion-corfu.el --- Completion with Corfu
;;; Commentary:
;;
;;; Code:

(use-package corfu
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-commit-predicate nil)   ;; Do not commit selected candidates on next input
  ;; (corfu-quit-at-boundary t)     ;; Automatically quit at word boundary
  ;; (corfu-quit-no-match t)        ;; Automatically quit if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; You may want to enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Use TAB for cycling, default is `corfu-complete'.
  ;; :bind
  ;; (:map corfu-map
  ;;       ("TAB" . corfu-next)
  ;;       ([tab] . corfu-next)
  ;;       ("S-TAB" . corfu-previous)
  ;;       ([backtab] . corfu-previous))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (corfu-global-mode))

;; extra CAPF backends
(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-sgml)
  :custom
  (cape-dict-file "~/words.en.txt")
  :general
  (general-nmap
    ", a a" 'completion-at-point
    ", a f" 'cape-file
    ", a g" 'cape-sgml
    ", a t" 'cape-tex
    ", a w" 'cape-dict
    ", a d" 'cape-dabbrev))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'completion-corfu)

;;; completion-corfu.el ends here
