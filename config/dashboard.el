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


(unless (package-installed-p 'request)
  (package-refresh-contents)
  (package-install 'request)
  )

;; Use request.el for API call
(use-package request)

;; Item display function
(defun dashboard-qiita-insert-list (list-display-name list)
  "Render LIST-DISPLAY-NAME and items of LIST."
  (dashboard-insert-heading list-display-name)
  (mapc (lambda (el)
          (insert "\n    ")
          (widget-create 'push-button
                         :action `(lambda (&rest ignore)
                                    (browse-url ,(cdr (assoc 'url el))))
                         :mouse-face 'highlight
                         :follow-link "\C-m"
                         :button-prefix ""
                         :button-suffix ""
                         :format "%[%t%]"
                         (decode-coding-string (cdr (assoc 'title el)) 'utf-8))) list))

;; Function to get and display articles
(defun dashboard-qiita-insert (list-size)
  "Add the list of LIST-SIZE items from qiita."
  (request
   ;; (format "https://qiita.com/api/v2/items?page=1&per_page=%s" list-size)
   (format "https://qiita.com/api/v2/items?page=1&per_page=%s" list-size)
   :sync t
   :parser 'json-read
   :success (cl-function
             (lambda (&key data &allow-other-keys)
               (dashboard-qiita-insert-list "Qiita(emacs-tag):" data)))))

;; add an article to the dashboard
(add-to-list 'dashboard-item-generators '(qiita . dashboard-qiita-insert))

(setq dashboard-items '((qiita . 10)
						(recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))
                        
