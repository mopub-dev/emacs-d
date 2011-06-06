;; john.pena@gmail.com


;; Turn off toolbar/menubar/scrollbars
;; (Do it immediately)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; Set the load path to the directory this file is in.
;; Usually ~/.emacs.d/
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq plugins-dir (file-name-directory
                   (concat dotfiles-dir "plugins/")))

;; Imports
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path plugins-dir)

;; Load plugins ;;

(add-to-list 'load-path (concat plugins-dir "yasnippet/"))
(add-to-list 'load-path (concat plugins-dir "rails/"))
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat plugins-dir "color-theme/"))
(add-to-list 'load-path (concat plugins-dir "org/lisp"))
(add-to-list 'load-path (concat plugins-dir "emacs-jabber/"))
(add-to-list 'load-path (concat plugins-dir "org/contrib/lisp"))
(load-file "~/.emacs.d/plugins/nxhtml/autostart.el")


(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'hexrgb)
(require 'snippet)
(require 'find-recursive)

(require 'ruby-mode)
(require 'ruby-electric)
(require 'inf-ruby)
(require 'rails)
(require 'scss-mode)

;; yasnippet (textmate-like snippets)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat plugins-dir "yasnippet/snippets/"))
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))

;; nXHTML (has django stuff)
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; linum (line numbers)
(require 'linum)

;; Colors/fonts
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-hellacious-j)


(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#333") ;; To customize the background color

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; uniquify renames buffers to be unique, so no more index.html | index.html<2>
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Anything launcher. It's awesome, like quicksilver for emacs
(require 'anything)

;; Org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(require 'dpaste)
(global-set-key "\C-cd" 'dpaste-region)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'jabber)
(setq jabber-account-list
      '(("john.pena@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;; Load my personal files
(require 'settings) ;; personal settings
(require 'functions) ;; personal defuns
(require 'mappings)  ;; personal key mappings

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scheme-program-name "mzscheme"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )