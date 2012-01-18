
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("1440d751f5ef51f9245f8910113daee99848e2c0" "357f98f42f4d5763f3bb6503eb18b9b73c7b9ba4" "485737acc3bedc0318a567f1c0f5e7ed2dfde3fb" default)))
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
