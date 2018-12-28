;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (css . t)
   (java . t)
   (js . t)
   (python . t)
   (R . t)
   (shell . t)
   (sql . t)
   (sqlite . t)
   ))
(setq org-src-fontify-natively t)

(defface org-block-begin-line
  '((t (:foreground "#DD2C00" :background "#69F0AE")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-end-line
  '((t (:foreground "#DD2C00" :background "#69F0AE")))
  "Face used for the line delimiting the end of source blocks.")


(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "plantuml" "nxml" "C++" "css"
            "R" "sql" "latex" "lisp" "matlab" "perl" "ruby""sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                                           'org-insert-src-block)
                            ))
