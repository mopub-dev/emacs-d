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
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat dotfiles-dir "color-theme/"))
(add-to-list 'load-path (concat plugins-dir "org/lisp"))
(add-to-list 'load-path (concat plugins-dir "org/contrib/lisp"))
(load-file "~/.emacs.d/plugins/nxhtml/autostart.el")


(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)


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
(color-theme-twilight)
;;(color-theme-hellacious-j) ; my color theme

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; Anything launcher. It's awesome, like quicksilver for emacs
(require 'anything)

;; Org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; js2-mode, a better javascript mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; My settings ;;

;; Makes the window transparent.
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95 50))
(add-to-list 'default-frame-alist '(alpha 95 50))

;; C-c t sets window transparency
 (eval-when-compile (require 'cl))
 (defun toggle-transparency ()
   (interactive)
   (if (/=
        (cadr (frame-parameter nil 'alpha))
        100)
       (set-frame-parameter nil 'alpha '(100 100))
     (set-frame-parameter nil 'alpha '(95 50))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)


;; Turn off backup files (those fucking annoying foo~ files)
(setq make-backup-files nil)

;; Fuck you for making me type in 'yes' or 'no' instead of 'y' or 'n'. Gah!
(fset 'yes-or-no-p 'y-or-n-p) 

;; Shut the fuck up when I load emacs!! Just take me to *scratch*
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; Display the time in the minibuffer
(display-time)

;; Line and column numbers in the bar above the minibuffer
(line-number-mode 1)
(column-number-mode 1)

;; Set the meta key to command on OSX (its set to 'option' in emacs23)
(setq mac-command-modifier 'meta)

;; Turn off the audio bell, replace it with a visual bell.
(setq visible-bell t)
(setq skeleton-pair t)

;; Sets the default font. Wow, that string is ugly. Thanks for making it easy on me emacs!
(if (eq system-type 'darwin)
   (set-face-font 'default " -*-Monaco-normal-r-*-*-17-102-120-120-c-*-iso8859-1"))
;    (set-face-font 'default "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-fontset-startup"))
;    (set-face-font 'default "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

;; Set the size of the font. Height is 10x normal font size. So, 12pt = 120.
(set-face-attribute 'default nil :height 100)

;; Return adds a newline AND indents
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Instead of tooltips opening in another fucking frame (incredibly annoying and disruptive),
;; display them in the echo area. Why this is not default, I don't understand.
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; This sets the default size of the frame. Ideally it should determine the resolution
;; and set accordingly. But it doesn't, because I'm lazy.
(setq initial-frame-alist '((width . 170) (height . 48)))

;; These are some settings for erc, the irc client I use in emacs
(erc-timestamp-mode t)
;; Notify me if someone calls me
(erc-match-mode t)
;; Some basic settings for erc package
(setq erc-server "irc.freenode.net" 
      erc-port 6667 
      erc-nick "streblo"
      erc-user-full-name "Wub Womper"
      erc-email-userid "streblo"
      erc-prompt-for-password t
      erc-fill-prefix "      "
      erc-auto-query t
;      erc-pals '("list" "of" "people" "i" "know")
      erc-keywords '("streblo" "geckimo", "409advisor", "409", "409A")   
      erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "%H:%M "
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-log-channels t
      erc-log-channels-directory "~/.irclogs"
      erc-log-insert-log-on-open t
)


(tooltip-mode -1)
(setq tooltip-use-echo-area t)


;; Set up tags
(setq tags-file-name "~/TAGS")
(global-set-key (kbd "<f5>") 'find-tag)

;; Deleted files go to the trash
(setq delete-by-moving-to-trash t)

;; Show changes when asking to save
(highlight-changes-mode)

;; Load my personal files
(require 'functions) ;; personal defuns
(require 'mappings)  ;; personal key mappings

;; init.el ends here