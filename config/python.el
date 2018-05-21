(unless (package-installed-p 'elpy)
  (package-refresh-contents)
  (package-install 'elpy)
  )
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(setq python-shell-interpreter "/usr/local/bin/ipython3")


;; active flycheck instead of flymake
(unless (package-installed-p 'flycheck)
  (package-refresh-contents)
  (package-install 'flycheck)
  )
(when (require 'flycheck nil t)
    (remove-hook 'elpy-modules 'elpy-module-flymake)
    (add-hook 'elpy-mode-hook 'flycheck-mode))


(define-key elpy-mode-map (kbd "C-c C-v") 'helm-flycheck)

(unless (package-installed-p 'smartrep)
  (package-refresh-contents)
  (package-install 'smartrep)
  )
(require 'smartrep)
(smartrep-define-key elpy-mode-map "C-c"
    '(("C-n" . flycheck-next-error)
      ("C-p" . flycheck-previous-error)))

;; setup indent hiright
(unless (package-installed-p 'highlight-indentation)
  (package-refresh-contents)
  (package-install 'highlight-indentation)
  )
(set-face-background 'highlight-indentation-face "#313131")
(set-face-background 'highlight-indentation-current-column-face "#777777")
(add-hook 'elpy-mode-hook 'highlight-indentation-current-column-mode)

(unless (package-installed-p 'jedi-core)
  (package-refresh-contents)
  (package-install 'jedi-core)
  )
(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)

(unless (package-installed-p 'company-jedi)
  (package-refresh-contents)
  (package-install 'company-jedi)
  )
(add-to-list 'company-backends 'company-jedi) ; backendに追加
