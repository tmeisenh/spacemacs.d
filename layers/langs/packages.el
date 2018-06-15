(setq langs-packages
      '(flycheck
        js2-mode
        rjsx-mode
        scss-mode
        )
      )

(defun langs/post-init-flycheck ()
  (setq flycheck-disabled-checkers '(javascript-jshint)
        flycheck-checkers '(javascript-eslint))

  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint javascript-standard))
      (flycheck-add-mode checker 'rjsx-mode)
    )))

(defun langs/post-init-rjsx-mode ()
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  (add-hook 'rjsx-mode-hook 'flycheck-mode)
  (add-hook 'rjsx-mode-hook 'eslintd-fix-mode)
  )

(defun langs/post-init-js2-mode ()
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'eslintd-fix-mode)

  )

(defun langs/post-init-scss-mode ()
  (add-hook 'scss-mode-hook 'flycheck-mode)
  (add-hook 'scss-mode-hook 'flycheck-mode)
  (add-hook 'scss-mode-hook
            (lambda ()
              (add-hook 'after-save-hook #'stylelint-fix-file-and-revert nil 'make-it-local))))
