;;系统支持
;;sudo apt install python-gi python-gi-cairo python3-gi python3-gi-cairo gir1.2-gtk-3.0
;;sudo apt install gir1.2-appindicator3-0.1

(defun ubuntu-indicator ()
  (interactive)
  (call-process-shell-command "nohup python3 ~/.emacs.d/lib/ubuntu-indicator/emacs-task-indicator.py -f ~/.clockin_task > nohup.out 2>&1 &" nil 0))

(global-set-key (kbd "C-S-i") 'ubuntu-indicator)