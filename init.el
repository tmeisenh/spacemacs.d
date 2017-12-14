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
    ;; (macros :location local)
    (config :location local)
    (display :location local)
    ;; (langs :location local)
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

  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'eslintd-fix-mode)

  (add-hook 'scss-mode-hook 'flycheck-mode)

  (add-hook 'react-mode-hook 'flycheck-mode)
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

  ) ;; end user-config
;; Junk below here
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode xterm-color web-mode web-beautify vimrc-mode unfill terraform-mode hcl-mode tagedit swift-mode sql-indent smeargle slim-mode slack circe oauth2 websocket shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor rubocop rspec-mode robe realgud test-simple loc-changes load-relative rbenv rake rainbow-mode rainbow-identifiers pug-mode orgit org-projectile org-category-capture org-present org-pomodoro org-download org-brain ob-elixir nginx-mode mwim multi-term mmm-mode minitest meghanada markdown-toc markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode less-css-mode js2-refactor multiple-cursors js2-mode js-doc impatient-mode simple-httpd htmlize helm-gtags helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode gradle-mode gnuplot gitignore-mode github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache gh-md ggtags fuzzy flyspell-correct-helm flyspell-correct flycheck-mix flycheck-credo flycheck evil-org evil-magit magit git-commit ghub with-editor eshell-z eshell-prompt-extras esh-help erlang ensime sbt-mode scala-mode emojify ht emoji-cheat-sheet-plus emmet-mode dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat disaster diff-hl dash-at-point dactyl-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emoji company-emacs-eclim eclim company-c-headers color-identifiers-mode coffee-mode cmake-mode cmake-ide levenshtein clang-format chruby bundler inf-ruby browse-at-remote auto-yasnippet yasnippet auto-dictionary alert log4e gntp alchemist company elixir-mode ac-ispell auto-complete zoom-window ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org symon string-inflection spaceline restclient restart-emacs rainbow-delimiters popwin persp-mode pcre2el password-generator paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag gruvbox-theme groovy-mode google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eslintd-fix elisp-slime-nav editorconfig dumb-jump diminish define-word column-enforce-mode color-theme-solarized coin-ticker clean-aindent-mode auto-highlight-symbol auto-compile all-the-icons-dired aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
