
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

;; Map option-up/down do page-up/down
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)

;; Make sure emacs does not use tabs but only spaces
(setq-default indent-tabs-mode nil)

;; C Style that I prefer
(setq c-default-style "ellemtel")
(setq c-electric-flag t)
(setq c-basic-offset 4)
(c-set-offset 'arglist-cont-nonempty '+)
(c-set-offset 'access-label -2);
(c-set-offset 'innamespace 0);

;; Auto chmod +x for scripts
(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;; Turn off gui stuff that i don't care about
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(blink-cursor-mode nil)

;; Source in local file if it exists
(when (file-readable-p "~/.emacs.local")
  (load "~/.emacs.local"))

