;;; misc.el --- Misc packages
;;; Commentary:
;;; Code:


;; TODO make it declarative
;; y/n instead of yes/no
;; (defalias 'yes-or-no-p 'y-or-n-p) no longer needed in Emacs 28.1

;; Minimal UI in terminal as well
;; (if (fboundp 'scroll-bar-mode)
;;     (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode)
;;     (tool-bar-mode -1))

(use-package osm
  ;; :bind (("C-c m h" . osm-home)
  ;;        ("C-c m s" . osm-search)
  ;;        ("C-c m v" . osm-server)
  ;;        ("C-c m t" . osm-goto)
  ;;        ("C-c m x" . osm-gpx-show)
  ;;        ("C-c m j" . osm-bookmark-jump))
  :custom
  ;; Take a look at the customization group `osm' for more options.
  (osm-server 'opentopomap) ;; Configure the tile server
  (osm-copyright t)     ;; Display the copyright information
  ;; (osm-pin-colors '((osm-track . "#00a")))
  ;; (osm-home '(47.1578 27.5865 16))
  (osm-track-style "stroke:#00a;stroke-width:5;stroke-linejoin:round;stroke-linecap:round;opacity:0.9;"))
  ;; :init
  ;; ;; Load Org link support
  ;; (with-eval-after-load 'org
  ;;   (require 'osm-ol)))

(message "==> INIT: misc.el")

(provide 'misc)

;;; misc.el ends here
