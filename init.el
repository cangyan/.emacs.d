(setq frame-title-format "emacs")

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq custom-safe-themes t)

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(set-default 'cursor-type 'hbar)

(ido-mode)

(which-func-mode 1)

(column-number-mode)

(show-paren-mode)

(global-hl-line-mode)

(setq-default indent-tabs-mode nil)

(winner-mode t)

(windmove-default-keybindings)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.emacs-china.org/gnu/")
	     t)

(add-to-list 'package-archives
	     '("melpa" . "http://elpa.emacs-china.org/melpa/")
	     t)
(add-to-list 'package-archives
	     '("marmalade" . "http://elpa.emacs-china.org/marmalade/")
	     t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(require 'use-package)

(use-package diminish :ensure t)
(use-package bind-key :ensure t)

(unless (package-installed-p 'exec-path-from-shell)
  (package-refresh-contents)
  (package-install 'exec-path-from-shell)
  )

(require 'exec-path-from-shell)

(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/package")
(load-directory "~/.emacs.d/config")

(ac-config-default)

(unless (package-installed-p 'helm)
  (package-refresh-contents)
  (package-install 'helm)
  )
(unless (package-installed-p 'helm-projectile)
  (package-refresh-contents)
  (package-install 'helm-projectile)
  )

(helm-mode t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(unless (package-installed-p 'nlinum)
  (package-refresh-contents)
  (package-install 'nlinum)
  )

(nlinum-mode)

(unless (package-installed-p 'autopair)
  (package-refresh-contents)
  (package-install 'autopair)
  )

(autopair-global-mode)

(unless (package-installed-p 'undo-tree)
  (package-refresh-contents)
  (package-install 'undo-tree)
  )

(global-undo-tree-mode)

(global-set-key (kbd "M-/") 'undo-tree-visualize)

(unless (package-installed-p 'switch-window)
  (package-refresh-contents)
  (package-install 'switch-window)
  )

(global-set-key (kbd "C-M-z") 'switch-window)


(unless (package-installed-p 'ace-jump-mode)
  (package-refresh-contents)
  (package-install 'ace-jump-mode)
  )

(global-set-key (kbd "C-c >") 'ace-jump-mode)

(unless (package-installed-p 'alpha)
  (package-refresh-contents)
  (package-install 'alpha)
  )
(require 'alpha)

(global-set-key (kbd "C-M-)") 'transparency-increase)

(global-set-key (kbd "C-M-(") 'transparency-decrease)

(unless (package-installed-p 'multiple-cursors)
  (package-refresh-contents)
  (package-install 'multiple-cursors)
  )
(global-set-key (kbd "C-}") 'mc/mark-next-like-this)

(global-set-key (kbd "C-{") 'mc/mark-previous-like-this)


(unless (package-installed-p 'powerline)
  (package-refresh-contents)
  (package-install 'powerline)
  )
(powerline-center-theme)

(setq powerline-default-separator 'wave)

(unless (package-installed-p 'neotree)
  (package-refresh-contents)
  (package-install 'neotree)
  )
(global-set-key (kbd "C-c C-t o") 'neotree)

(global-set-key (kbd "C-c C-t h") 'neotree-hide)

(unless (package-installed-p 'expand-region)
  (package-refresh-contents)
  (package-install 'expand-region)
  )
(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)


(unless (package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company)
  )
(company-mode t)

(global-set-key (kbd "C-+") 'text-scale-increase)

(global-set-key (kbd "C--") 'text-scale-decrease)

(unless (package-installed-p 'super-save)
  (package-refresh-contents)
  (package-install 'super-save)
  )
(super-save-mode t)

;;(setq super-save-auto-save-when-idle t)

(setq auto-save-default nil)

(unless (package-installed-p 'dumb-jump)
  (package-refresh-contents)
  (package-install 'dumb-jump)
  )
(global-set-key (kbd "C-M-g") 'dumb-jump-go)

(global-set-key (kbd "C-M-p") 'dumb-jump-back)

(global-set-key (kbd "C-M-q") 'dumb-jump-quick-look)

(setq-default indicate-empty-lines t)

(unless (package-installed-p 'hiwin)
  (package-refresh-contents)
  (package-install 'hiwin)
  )
(when (require 'hiwin nil t)
  (hiwin-activate)
  (set-face-background 'hiwin-face "gray20"))


(setq tramp-default-method "ssh")
(setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(unless (package-installed-p 'golden-ratio)
  (package-refresh-contents)
  (package-install 'golden-ratio)
  )
(golden-ratio-mode 1)

(add-to-list 'golden-ratio-exclude-buffer-names " *NeoTree*")

(unless (package-installed-p 'ace-window)
  (package-refresh-contents)
  (package-install 'ace-window)
  )
(global-set-key (kbd "<C-left>")  'windmove-left)
(global-set-key (kbd "<C-down>")  'windmove-down)
(global-set-key (kbd "<C-up>")    'windmove-up)
(global-set-key (kbd "<C-right>") 'windmove-right)

(unless (package-installed-p 'shell-pop)
  (package-refresh-contents)
  (package-install 'shell-pop)
  )
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(global-set-key (kbd "C-c o") 'shell-pop)


(global-set-key (kbd "C-c S") 'hs-show-all)
(global-set-key (kbd "C-c H") 'hs-hide-all)
(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c @ C-c") 'hs-toggle-hiding)

(setq org-startup-with-inline-images t)

(setq require-final-newline t)

(setq mouse-1-click-follows-link nil)

(use-package yasnippet
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  :config
  (yas-reload-all)
  (use-package yasnippet-snippets
    :ensure t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (yasnippet-snippets shell-pop ace-window golden-ratio hiwin dumb-jump super-save expand-region neotree multiple-cursors alpha ace-jump-mode switch-window undo-tree autopair nlinum helm-projectile calfw-ical calfw powerline solarized-theme company-jedi jedi-core smartrep elpy ac-php use-package popwin helm-ag go-rename go-guru go-eldoc go-direx flycheck exec-path-from-shell diminish dashboard company-go)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-default-font "Hack Nerd Font 14")
