(unless (package-installed-p 'ac-php)
  (package-refresh-contents)
  (package-install 'ac-php)
  )

(require 'cl)
(require 'php-mode)
(require 'php-doc)
(add-hook 'php-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php ) )
             (yas-global-mode 1)
             (ac-php-core-eldoc-setup ) ;; enable eldoc
	     (subword-mode 1)
	     (setq indent-tabs-mode nil)
	     (setq c-basic-offset 4)
	     (setq php-template-compatibility nil)

             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
	     (local-set-key (kbd "M-P") 'php-insert-doc-block)
             ))

(defun bs-web-mode-hook ()
  (local-set-key '[backtab] 'indent-relative)
  (setq indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 4
        web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4))

(add-hook 'web-mode-hook 'bs-web-mode-hook)


(defun toggle-php-flavor-mode ()
  (interactive)
  "Toggle mode between PHP & Web-Mode Helper modes"
  (cond ((string= mode-name "PHP")
         (web-mode))
        ((string= mode-name "Web")
         (php-mode))))

(global-set-key (kbd "<f5>") 'toggle-php-flavor-mode)
