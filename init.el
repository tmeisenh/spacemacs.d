;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Don't autosave and backup everything
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq ensime-startup-notification nil) ;; Stop the warning buffer from opening on startup
(setq ensime-startup-snapshot-notification nil) ;; Stop the warning buffer from opening on startup

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     c-c++
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     better-defaults
     dash
     docker
     elixir
     emacs-lisp
     emoji
     erlang
     git
     github
     gtags
     helm
     html
     java
     javascript
     markdown
     nginx
     org
     react
     ruby
     shell
     slack
     spell-checking
     sql
     swift
     terraform
     tmux
     vimscript
     yaml
     )
   dotspacemacs-additional-packages '(
                                      all-the-icons      ;; Allow icons to be used in places where it makes senseall-the-icons
                                      all-the-icons-dired;; Use the pretty icons in dir mode
                                      eslintd-fix        ;; run eslint --fix on save
                                      gruvbox-theme      ;; The best colors
                                      groovy-mode        ;; 
                                      restclient         ;; A built in restclient similar to Postman
                                      zoom-window        ;; Zoom frames like tmux zooms panes
                                      color-theme-solarized
                                      coin-ticker
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 10))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (global-auto-revert-mode t)


  (use-package zoom-window
    :ensure t
    :init
    (custom-set-variables
     '(zoom-window-mode-line-color "#8f3f71"))
    (spacemacs/set-leader-keys
      "zz"  'zoom-window-zoom
      "zn"  'zoom-window-next))

  (use-package gruvbox-theme
    :ensure t
    :init
    (disable-theme 'spacemacs-dark)
    (load-theme 'gruvbox t t)
    (custom-theme-set-faces 'gruvbox
                            '(web-mode-html-attr-custom-face ((t (:slant italic))))
                            '(web-mode-html-attr-name-face ((t (:slant italic)))))
    (enable-theme 'gruvbox))

  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

  (setq-default
   js-indent-level 2
   js2-strict-missing-semi-warning nil

   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        flycheck-disabled-checkers '(javascript-jshint)
        flycheck-checkers '(javascript-eslint))

  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint javascript-standard))
      (flycheck-add-mode checker 'react-mode)))

  (add-hook 'react-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'scss-mode-hook 'flycheck-mode)

  (add-hook 'js2-mode-hook 'eslintd-fix-mode)
  (add-hook 'react-mode-hook 'eslintd-fix-mode)

  ;; https://github.com/purcell/exec-path-from-shell
  ;; only need exec-path-from-shell on OSX
  ;; this hopefully sets up path and other vars better
  (exec-path-from-shell-initialize)

  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  (defun stylelint-fix-file ()
    (interactive)
    (message "stylelint --fix for file " (buffer-file-name))
    (shell-command (concat "stylelint --fix " (buffer-file-name))))

  (defun stylelint-fix-file-and-revert ()
    (interactive)
    (stylelint-fix-file)
    (revert-buffer t t))

  (add-hook 'scss-mode-hook
            (lambda ()
              (add-hook 'after-save-hook #'stylelint-fix-file-and-revert nil 'make-it-local)))

  (add-to-list 'auto-mode-alist '("Jenkinsfile$" . groovy-mode))

  ;; Org mode
  (setq org-directory "~/Documents/org")

  ;; MobileOrg
  (setq org-mobile-files '("~/Documents/org"))
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
  (setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))

  ;; SPACE m m p
  ;; SPACE m m l
  (evil-leader/set-key-for-mode 'org-mode
    "mp" 'org-mobile-push
    "ml" 'org-mobile-pull
  )

  (require 'coin-ticker)
  (setq coin-ticker-api-poll-interval 30)
  (setq coin-ticker-syms '("BTC" "ETH" "LTC"))
  ;; Optional: Just show prices (and no symbols)
  (setq coin-ticker-show-syms 1)
  (setq coin-ticker-price-convert "USD")
  (setq coin-ticker-price-symbol "$")
  (coin-ticker-mode 1)

  ) ;; end user-config
;; Junk below here
