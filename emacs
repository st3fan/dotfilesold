
;; Get rid of the menu bar
(menu-bar-mode -1)

;; Do not show the startup screen
(setq inhibit-splash-screen t)

;; Enable paren mode
(require 'paren)
(show-paren-mode 1)

;; Show a clock in the status bar
(display-time)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; Show the column in the status bar
(setq column-number-mode t)

;; Goto line is M-g
(global-set-key "\M-g" 'goto-line)

;; C Style that I prefer
(setq c-default-style "ellemtel")
(setq c-electric-flag t)
(c-set-offset 'arglist-cont-nonempty '+)

;; Source in local file if it exists
(when (file-readable-p "~/.emacs.local")
  (load "~/.emacs.local"))
