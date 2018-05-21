;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(require 'org-mouse)
(require 'org-depend)

(setq org-enforce-todo-dependencies t)
(setq org-agenda-skip-deadline-prewarning-ifscheduled t)
