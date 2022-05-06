;;; windows.el --- Windows essentials
;;; Commentary:
;;; Code:

(use-package golden-ratio
  :diminish "GR"
  :config
  (golden-ratio-mode))

(use-package ace-window
  :general
  (icostan/leader-keys
    :states '(normal visual motion)
    :keymaps 'override
    "w"   '(:ignore t :wk "windows")
    "ww"  '(ace-select-window :wk "move to any")
    "wl"  '(windmove-right :wk "move right")
    "wh"  '(windmove-left :wk "move left")
    "wk"  '(windmove-up :wk "move up")
    "wj"  '(windmove-down :wk "move bottom")
    "w|"  '(split-window-right :wk "split right")
    "w-"  '(split-window-below :wk "split bottom")
    "wd"  '(delete-window :wk "delete any")
    "wD"  '(ace-delete-window :wk "delete window")
    "wx"  '(delete-other-windows :wk "delete other window")
    "wm"  '(demap-toggle :wk "demap toggle ")
    "wo"  '(scroll-other-window :wk "scroll other")
    "wg"  '(golden-ratio-toggle-widescreen :wk "golden ratio")
    "ws"  '(ace-swap-window :wk "swap")))

(use-package winum
  :init
  (winum-mode 1))


(use-package minimap)

(use-package demap
  :custom
  (demap-minimap-window-width 32))

;; TODO: try evil-window: "C-w"
;; TODO: try https://github.com/auto-complete/popup-el
(message "==> INIT: windows.el")

(provide 'windows)

;;; windows.el ends here
