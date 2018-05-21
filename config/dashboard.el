(unless (package-installed-p 'dashboard)
  (package-refresh-contents)
  (package-install 'dashboard)
  )
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Set the title
(setq dashboard-banner-logo-title "Day Day Coding")
;; Set the banner
(setq dashboard-startup-banner "~/.emacs.d/images/geek.png")
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png which displays whatever image you would prefer

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))
