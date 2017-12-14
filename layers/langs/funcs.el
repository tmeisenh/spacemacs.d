(defun stylelint-fix-file ()
  (interactive)
  (message "stylelint --fix for file " (buffer-file-name))
  (shell-command (concat "stylelint --fix " (buffer-file-name))))

(defun stylelint-fix-file-and-revert ()
  (interactive)
  (stylelint-fix-file)
  (revert-buffer t t))
