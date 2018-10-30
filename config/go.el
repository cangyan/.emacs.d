;;插件安装列表
;; goimports
;; godoc
;; godef
;; goru
;; golint
;; company-go
;; gocode

;; go get golang.org/x/tools/cmd/goimports
;; go get golang.org/x/tools/cmd/godoc
;; go get github.com/rogpeppe/godef
;; go get golang.org/x/tools/cmd/guru
;; go get golang.org/x/lint/golint
;; go get github.com/nsf/gocode
;; go get golang.org/x/tools/cmd/gorename

;; gocode set autobuild true

(let ((envs '("PATH" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

(use-package go-mode
  :ensure t
  :mode (("\\.go\\'" . go-mode))
  :hook ((before-save . gofmt-before-save))
  :config
  (setq gofmt-command "goimports")
  (use-package company-go
    :ensure t
    :config
    (add-hook 'go-mode-hook (lambda()
                              (add-to-list (make-local-variable 'company-backends)
                                           '(company-go company-files company-yasnippet company-capf company-dabbrev)))))
  (use-package go-eldoc
    :ensure t
    :hook (go-mode . go-eldoc-setup)
    )
  (use-package go-guru
    :ensure t
    :hook (go-mode . go-guru-hl-identifier-mode)
    )
  (use-package go-rename
    :ensure t
    )
  (use-package go-direx
    :ensure t)
  )
(unless (package-install 'popwin)
  (package-refresh-contents)
  (package-install 'popwin))

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(push '("^\*go-direx:" :regexp t :position left :width 0.2 :dedicated t :stick t)
      popwin:special-display-config)


(provide 'go)
