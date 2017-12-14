(setq personal-packages
      '(zoom-window))

(defun personal/init-zoom-window ()
  (use-package zoom-window
    :config
    (custom-set-variables
     '(zoom-window-mode-line-color "#8f3f71"))
    (spacemacs/set-leader-keys
      "zz"  'zoom-window-zoom
      "zn"  'zoom-window-next)))
