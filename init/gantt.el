;;; gantt.el --- Gantt charts
;;; Commentary:
;;

;;; Code:

(use-package org-ql)
(use-package ts)
(use-package s)
(use-package dash)

(use-package elgantt
  :load-path "../lisp/elgantt"
  :config
  (setq elgantt-agenda-files "lisp/elgantt/test.org"))

(provide 'gantt)

;;; gantt.el ends here
