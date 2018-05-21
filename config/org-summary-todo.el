(setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
	(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
	(sequence "|" "CANCELED(c)")
	(type "吴雄杰(1)" "刘英伟(2)" "刘峰(3)" "孟凤真(4)" "王克园(5)" "苏小飞(6)" "王鸿钰(7)" "|" )))
(defun org-summary-todo (n-done n-not-done)
	"Switch entry to DONE when all subentries are done, to TODO otherwise."
	(let (org-log-done org-log-states) ; turn off logging
	(org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("NEXT" . org-warning) ("REPORT" . org-warning) ("BUG" . org-warning) ("KNOWNCAUSE" . org-warning)
	("CANCELED" . (:foreground "blue" :weight bold))))

;; This is for org-mode agenda view activation
 (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
 ;; This is for key bindings to invoke agenda mode (see line-2)
 (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cc" 'org-capture)
 (global-set-key "\C-cb" 'org-iswitchb)
