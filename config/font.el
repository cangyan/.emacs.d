(cond ((display-graphic-p)
	;; Setting English Font
	(set-face-attribute 'default nil :font "DejaVu Sans Mono 10")

	;; Chinese Font
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
  		(set-fontset-font (frame-parameter nil 'font)
                    	charset (font-spec :family "Microsoft Yahei"
                                       	:size 16))))
(t 0)
)
