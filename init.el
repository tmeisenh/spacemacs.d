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

(defun dotspacemacs/layers/packages ()
  "Packages I like"
  (setq-default

   dotspacemacs-additional-packages
   '(all-the-icons      ;; Allow icons to be used in places where it makes sense
     all-the-icons-dired;; Use the pretty icons in dir mode
     eslintd-fix        ;; run eslint --fix on save
     gruvbox-theme      ;; The best colors
     groovy-mode        ;;
     restclient         ;; A built in restclient similar to Postman
     zoom-window        ;; Zoom frames like tmux zooms panes
     coin-ticker        ;; bitcoin ticker
     )

   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-but-keep-unused)
  )

(defun dotspacemacs/layers/config ()
  "General layer configuration"
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t

   dotspacemacs-configuration-layer-path '()

   ;; dotspacemacs-configuration-layer-path
   ;; (list (os-path "~/.spacemacs.d/layers/"))

   dotspacemacs-configuration-layers
   (append
    dotspacemacs/layers/core
    dotspacemacs/layers/coding
    dotspacemacs/layers/local
    )
   ))

(defvar dotspacemacs/layers/core
  '(
    auto-completion
    (colors :variables colors-enable-nyan-cat-progress-bar t)
    better-defaults
    emoji
    git
    github
    helm
    org
    slack
    spell-checking
    tmux
    )
  "Layers I consider core to Spacemacs.")

(defvar dotspacemacs/layers/coding
  '(
    c-c++
    dash
    docker
    elixir
    emacs-lisp
    erlang
    gtags
    html
    java
    javascript
    markdown
    nginx
    react
    ruby
    semantic
    shell
    sql
    swift
    terraform
    vimscript
    yaml
    )
  "Layers for coding.")

(defvar dotspacemacs/layers/local
  '(
    (config :location local)
    (display :location local)
    (langs :location local)
    (personal :location local)
    )
  "Local layers housed in `~/.spacemacs.d/layers'. (These five are required!)")

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (dotspacemacs/layers/config)
  (dotspacemacs/layers/packages)
  )

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

  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))

  ;; https://github.com/purcell/exec-path-from-shell
  ;; only need exec-path-from-shell on OSX
  ;; this hopefully sets up path and other vars better
  (exec-path-from-shell-initialize)

  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

  (add-to-list 'auto-mode-alist '("Jenkinsfile$" . groovy-mode))

  ) ;; end user-config
;; Junk below here
