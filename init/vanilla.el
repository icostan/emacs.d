;;; vanilla.el --- Vanilla
;;; Commentary:
;;; Code:

(defun vanilla-projectile-goto-todos ()
  "Go to project's TODOs file."
  (interactive)
  (org-projectile-goto-location-for-project
    (projectile-project-name)))
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

(defun icostan/kill-other-buffer ()
  "Kill buffer in other window"
  (interactive)
  (ace-select-window)
  (kill-this-buffer)
  (ace-select-window))

;;; https://tony-zorman.com/posts/package-vc-install.html
(cl-defun
  icostan/vc-install (&key (fetcher "github") repo name rev backend)
  "Install a package from a remote if it's not already installed.
This is a thin wrapper around `package-vc-install' in order to
make non-interactive usage more ergonomic.  Takes the following
named arguments:

- FETCHER the remote where to get the package (e.g., \"gitlab\").
  If omitted, this defaults to \"github\".

- REPO should be the name of the repository (e.g.,
  \"slotThe/arXiv-citation\".

- NAME, REV, and BACKEND are as in `package-vc-install' (which
  see)."
  (let*
    (
      (url (format "https://www.%s.com/%s" fetcher repo))
      (iname
        (when name
          (intern name)))
      (pac-name (or iname (intern (file-name-base repo)))))
    (unless (package-installed-p pac-name)
      (package-vc-install url iname rev backend))))

(message "==> INIT: vanilla.el")

(provide 'vanilla)

;;; vanilla.el ends here
