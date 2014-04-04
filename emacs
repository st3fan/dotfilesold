(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/")  t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(cyberpunk-theme
    clojure-mode
    cider
    go-mode
    smartparens
    expand-region
    rainbow-delimiters
    magit)
  "list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'cyberpunk t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing

(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-delay 0) ; disable delay
(setq show-paren-style 'parenthesis) ; highlight entire bracket expression

(column-number-mode 1)

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

(recentf-mode 1) ; keep a list of recently opened files

(global-hl-line-mode 1) ; turn on highlighting current line

(setq inhibit-splash-screen t)

(setq display-time-24hr-format 1)
(display-time-mode 1)

(setq-default indent-tabs-mode nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;

(require 'expand-region)
(global-set-key (kbd "M-e") 'er/expand-region)

;;

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;

(add-hook 'after-save-hook
  'executable-make-buffer-file-executable-if-script-p)

;;

(smartparens-global-mode t)

;;

(setq nrepl-hide-special-buffers t)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-repl-history-size 1000)
(setq cider-repl-history-file "~/.cider-repl-history")

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
