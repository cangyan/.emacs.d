(unless (package-installed-p 'calfw)
  (package-refresh-contents)
  (package-install 'calfw)
  )

(unless (package-installed-p 'calfw-ical)
  (package-refresh-contents)
  (package-install 'calfw-ical)
  )

(require 'calfw)

(require 'calfw-ical)
(setq worldcup2018-calendar-url
"http://www.skysports.com/calendars/football/fixtures/competitions/world-cup")

(defun worldcup2018-calendar ()
(interactive)
(cfw:open-ical-calendar worldcup2018-calendar-url))
