;;; vanilla.el --- Vanilla
;;; Commentary:
;;; Code:

(defun vanilla-projectile-goto-todos ()
  "Go to project's TODOs file."
  (interactive)
  (org-projectile-goto-location-for-project (projectile-project-name)))
(defun vanilla-disaster-with-gcc ()
  "Compile with GCC."
  (interactive)
  (setq disaster-cc "gcc")
  (disaster))
(defun vanilla-disaster-with-clang ()
  "Compile with CLang."
  (interactive)
  (setq disaster-cc "clang")
  (disaster))
;; (defun vanilla-buffers-dashboard ()
;;   "Show dashboard."
;;   (interactive)
;;   (switch-to-buffer "*dashboard*"))
(defun vanilla-record-video ()
  "Print DEMO START message and start video recording."
  (interactive)
  (camcorder-mode 'toggle)
  (message " *** DEMO START - DEMO START - DEMO START *** "))
(defun vanilla-record-gif ()
  "Print DEMO START message and start GIF recording."
  (interactive)
  (gif-screencast-start-or-stop)
  (message " *** DEMO START - DEMO START - DEMO START *** "))
(defun vanilla-insert-task ()
  "Insert task."
  (interactive)
  (progn
    (end-of-line)
    (newline))
  (yas-expand-snippet (yas-lookup-snippet "task")))

(defun vanilla-helm-mode-p ()
  "Check if helm-mode is available."
  (not (eq helm-mode nil)))


(message "==> INIT: vanilla.el")

(provide 'vanilla)

;;; vanilla.el ends here
