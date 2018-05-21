;; plantuml.jarへのパスを設定
(setq org-plantuml-jar-path "~/.emacs.d/lib/plantuml.jar")

;; org-babelで使用する言語を登録
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))


(add-hook 'org-babel-after-execute-hook
          (lambda ()
            (when org-inline-image-overlays
              (org-redisplay-inline-images))))
