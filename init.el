
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs                                    ;;
;; John Pena (john.pena@alumni.duke.edu)     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; =========================================
; = Load dependencies and initialize them =
; =========================================

;; Set the load path to the directory this file is in.
;; Usually ~/.emacs.d/
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(setq plugins-dir (file-name-directory (concat dotfiles-dir "plugins/")))

;; Imports 
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path plugins-dir)

;; Load plugins
(add-to-list 'load-path (concat plugins-dir "yasnippet/"))
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat plugins-dir "eproject/"))
(add-to-list 'load-path (concat plugins-dir "ecb/"))
(add-to-list 'load-path (concat dotfiles-dir "color-theme/"))
(add-to-list 'load-path (concat plugins-dir "org/lisp"))
(add-to-list 'load-path (concat plugins-dir "org/contrib/lisp"))
(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")

;; yasnippet (textmate-like snippets)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat plugins-dir "yasnippet/snippets"))
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))

;; linum (line numbers)
(require 'linum)

;; ecb, does directory listings
(require 'ecb)

;; Auto-completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat plugins-dir "auto-complete/ac-dict"))
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; Colors/fonts
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(holy-fuck) ; my color theme

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; Anything. Launcher. It's awesome. 
(require 'anything)

;; Org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; initialize other .el files within .emacs.d
(require 'mysettings)
(require 'functions) ;; personal defuns
(require 'mappings)  ;; personal key mappings

;; init.el ends here