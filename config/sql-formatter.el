(setq sql-format-external-command
  (concat "java -jar " (expand-file-name "~/.emacs.d/lib/sql-formatter-1.0.0-jar-with-dependencies.jar")))

;; SQL文をフォーマットする関数
(defun my-format-sql ()
  "バッファまたはリージョン内のSQL文を整形する。"
  (interactive)
  (let (begin end)
    (cond (mark-active
           (setq begin (region-beginning))
           (setq end (region-end)))
          (t
           (setq begin (point-min))
           (setq end (point-max))))
    (save-excursion
      (shell-command-on-region
       begin
       end
       sql-format-external-command
       nil 
       t ; replace buffer
       ))))

;; キーバインド設定
(with-eval-after-load "sql"
  (define-key sql-mode-map (kbd "C-S-f") 'my-format-sql))
