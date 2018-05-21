(setq helm-ag-insert-at-point 'symbol)

(unless (package-installed-p 'helm-ag)
  (package-refresh-contents)
  (package-install 'helm-ag)
  )
(global-set-key (kbd "C-M-s") 'helm-ag)

(global-set-key (kbd "C-M-k") 'backward-kill-sexp)
