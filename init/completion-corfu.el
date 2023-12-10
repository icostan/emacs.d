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
  :general
  (:keymaps 'corfu-map
            ;; :states 'insert
            "SPC" #'corfu-insert-separator)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package orderless
  :custom
  (completion-category-defaults nil)
  (completion-category-overrides nil)
  ;; (completion-category-overrides
  ;;  '((file (styles partial-completion))
  ;;    (symbol (styles orderless-regexp))))
  (orderless-matching-styles '(orderless-regexp))
  (completion-styles '(orderless)))

;; (use-package corfu-doc
;;   :after corfu
;;   :custom
;;   (corfu-doc-max-height 30)
;;   :general
;;   (:keymaps 'corfu-map
;;             :states 'insert
;;             "C-d" #'corfu-doc-toggle
;;             "C-n" #'corfu-doc-scroll-up
;;             "C-p" #'corfu-doc-scroll-down)
;;   :config
;;   (corfu-doc-mode))

;; https://kristofferbalintona.me/posts/cape/
(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  ;; (add-to-list 'completion-at-point-functions #'cape-sgml)
  :custom
  (cape-dict-file "~/words.en.txt")
  :general
  (general-nmap
    ", a" '(nil :wk "completion")
    ", a a" 'completion-at-point
    ", a f" 'cape-file
    ", a g" 'cape-sgml
    ", a t" 'cape-tex
    ", a w" 'cape-dict
    ", a d" 'cape-dabbrev))

(use-package yasnippet-capf
  :after cape
  ;; :custom
  ;; (yasnippet-capf-lookup-by 'name)
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; (use-package nerd-icons-corfu
;;   :after corfu nerd-icons)

(use-package emacs
  :custom
  (completion-cycle-threshold nil)
  (tab-always-indent 'complete))

(message "==> INIT: completion-corfu.el")

(provide 'completion-corfu)

;;; completion-corfu.el ends here
