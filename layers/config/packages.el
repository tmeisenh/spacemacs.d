;;; Config Layer

(setq config-packages
      '((org-config      :location local))
      )

;;; Minor Config

(defun config/init-org-config ()
  (use-package org-config
    :after org))
