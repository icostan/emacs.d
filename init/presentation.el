;;; presentation.el --- Presentation essentials
;;; Commentary:
;;; Code:

(use-package demo-it
  :config
  (use-package org-tree-slide))

;; Screen casting
(use-package emacsshot)
;; (use-package camcorder)
(use-package gif-screencast)

;; Display typed commands
(use-package command-log-mode)
(use-package keycast)

;;; TRY: https://github.com/ir33k/tb-keycast

(message "==> INIT: presentation.el")

(provide 'presentation)

;;; presentation.el ends here
