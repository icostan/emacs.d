;;; completion-corfu.el --- Completion with Corfu
;;; Commentary:
;;
;;; Code:

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-echo-documentation nil)
  (corfu-min-width 80)
  (corfu-max-width corfu-min-width)
  ;; (corfu-separator ?\s)
  ;; (corfu-quit-no-match 'separator)
  :general
  (:keymaps 'corfu-map
            ;; :states 'insert
            "SPC" #'corfu-insert-separator
            "C-n" #'corfu-next
            "C-p" #'corfu-preview)
  :init
  (corfu-global-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-category-defaults nil)
  (completion-category-overrides nil)
  ;; (completion-category-overrides
  ;;  '((file (styles partial-completion))
  ;;    (symbol (styles orderless-regexp))))
  (orderless-matching-styles '(orderless-regexp))
  (completion-styles '(orderless)))

;; (use-package corfu-doc
;;   :quelpa (:fetcher github :repo "galeo/corfu-doc"))

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
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package emacs
  :custom
  (completion-cycle-threshold nil)
  (tab-always-indent 'complete))

(provide 'completion-corfu)

;;; completion-corfu.el ends here
