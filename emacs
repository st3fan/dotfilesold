
;; Get rid of the menu bar if we run in terminal mode
(if (not window-system)
    (menu-bar-mode -1))

;;(if window-system
;;    (load-theme 'wheatgrass))

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

;; Make sure emacs does not use tabs but only spaces
(setq-default indent-tabs-mode nil)

;; C Style that I prefer
(setq c-default-style "ellemtel")
(setq c-electric-flag t)
(setq c-basic-offset 4)
(c-set-offset 'arglist-cont-nonempty '+)
(c-set-offset 'access-label -2);
(c-set-offset 'innamespace 0);

;; Source in local file if it exists
(when (file-readable-p "~/.emacs.local")
  (load "~/.emacs.local"))

