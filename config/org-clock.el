(defvar clockin-task-file "~/.clockin_task")
  (defun write-clockin-task-file ()
    (with-temp-buffer
      (insert (concat (format-time-string "%s" org-clock-start-time)
                      "\t"
                      org-clock-heading))
      (write-region (point-min) (point-max) clockin-task-file))
    )

(defun delete-clockin-task-file ()
	(delete-file clockin-task-file))

(add-hook 'org-clock-in-hook 'write-clockin-task-file)
(add-hook 'org-clock-out-hook 'delete-clockin-task-file)
(add-hook 'org-clock-cancel-hook 'delete-clockin-task-file)

(setq org-clock-out-remove-zero-time-clocks t)


(defun my:org-clock-out-and-save-when-exit ()
  "Save buffers and stop clocking when kill emacs."
  (when (require 'org-clock nil t)
    (when (org-clocking-p)
    (org-clock-out)
    (save-some-buffers t))))

(add-hook 'kill-emacs-hook #'my:org-clock-out-and-save-when-exit)

(setq org-clock-out-when-done t)

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "^"))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "--")))
      (concat str "-> "))))

(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

