(setq langs-packages
      '(flycheck
        js2-mode
        scss-mode
        )
      )

(defun langs/post-init-flycheck ()
  (setq flycheck-disabled-checkers '(javascript-jshint)
        flycheck-checkers '(javascript-eslint))

  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint javascript-standard))
      (flycheck-add-mode checker 'react-mode)
    )))

(defun langs/post-init-js2-mode ()
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'eslintd-fix-mode)

  ;; post-init-react-mode doesn't get called
  (add-hook 'react-mode-hook 'flycheck-mode)
  (add-hook 'react-mode-hook 'eslintd-fix-mode)
  )

(defun langs/post-init-scss-mode ()
  (add-hook 'scss-mode-hook 'flycheck-mode)
  (add-hook 'scss-mode-hook 'flycheck-mode)
  (add-hook 'scss-mode-hook
            (lambda ()
              (add-hook 'after-save-hook #'stylelint-fix-file-and-revert nil 'make-it-local))))
