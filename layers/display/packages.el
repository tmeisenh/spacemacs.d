;;; Display Layer

(setq display-packages
      '(
        all-the-icons
        all-the-icons-dired
        gruvbox-theme
        powerline
        )
      )

(defun display/init-all-the-icons ()
  (use-package all-the-icons
    :config
    ))

(defun display/init-all-the-icons-dired ()
  (use-package all-the-icons-dired
    :config
    ))

(defun display/init-gruvbox-theme ()
  (use-package gruvbox-theme
    :config
    (disable-theme 'spacemacs-dark)
    (load-theme 'gruvbox t t)
    (custom-theme-set-faces 'gruvbox
                            '(web-mode-html-attr-custom-face ((t (:slant italic))))
                            '(web-mode-html-attr-name-face ((t (:slant italic)))))
    (enable-theme 'gruvbox))
  )

(defun display/init-powerline ()
  (use-package powerline
    :config

    (display-time-mode)
    (defpowerline display-time display-time-string)
    (setq display-time-format "%H:%M")
    ))
