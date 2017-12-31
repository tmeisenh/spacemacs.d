(require 'org)

(provide 'org-config)

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
  "I" 'org-table-field-info
  )
