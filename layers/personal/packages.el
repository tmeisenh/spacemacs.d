(setq personal-packages
      '(zoom-window
        coin-ticker)
      )

(defun personal/init-zoom-window ()
  (use-package zoom-window
    :config
    (custom-set-variables
     '(zoom-window-mode-line-color "#8f3f71"))
    (spacemacs/set-leader-keys
      "zz"  'zoom-window-zoom
      "zn"  'zoom-window-next
      "zc"  'evil-close-fold
      "zo"  'evil-open-fold)))

(defun personal/init-coin-ticker ()
  (use-package coin-ticker
    :config
    (setq
     coin-ticker-api-poll-interval 30
     coin-ticker-syms '("BTC" "ETH" "LTC" "XRP")
     coin-ticker-price-convert "USD"
     coin-ticker-price-symbol "$")
     (coin-ticker-mode t))
  )
