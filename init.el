;; if we don't laugh we'll cry


;; Set the load path to the directory this file is in.
;; Usually ~/.emacs.d/
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(setq plugins-dir (file-name-directory (concat dotfiles-dir "plugins/")))

;; Imports 
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path plugins-dir)


;;;;;;;;;;;;;;;;;;
;; Load plugins ;;
;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat plugins-dir "yasnippet/"))
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat plugins-dir "eproject/"))
(add-to-list 'load-path (concat plugins-dir "ecb/"))
(add-to-list 'load-path (concat dotfiles-dir "color-theme/"))
(add-to-list 'load-path (concat plugins-dir "org/lisp"))
(add-to-list 'load-path (concat plugins-dir "org/contrib/lisp"))
(add-to-list 'load-path (concat plugins-dir "twit/"))
(load-file "~/.emacs.d/plugins/cedet/common/cedet.el")
(load-file "~/.emacs.d/plugins/nxhtml/autostart.el")

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

;; ecb, does directory listings
(require 'ecb)

;; Colors/fonts
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-hellacious-j) ; my color theme

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; Anything launcher. It's awesome, like quicksilver for emacs
(require 'anything)

;; Quack, a Scheme interpreter
(require 'quack)

;; Org-mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)



;;;;;;;;;;;;;;;;;
;; My settings ;;
;;;;;;;;;;;;;;;;;

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

;; Turn off toolbar/menubar/scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

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

;; Last but not least..
;; Real lisp hackers use the lambda character
;; (im not a real lisp hacker)
(defun sm-lambda-mode-hook ()
  (font-lock-add-keywords
   nil `(("\\<lambda\\>"
   (0 (progn (compose-region (match-beginning 0) (match-end 0)
        ,(make-char 'greek-iso8859-7 107))
      nil))))))
(add-hook 'emacs-lisp-mode-hook 'sm-lambda-mode-hook)
(add-hook 'lisp-interactive-mode-hook 'sm-lamba-mode-hook)
(add-hook 'scheme-mode-hook 'sm-lambda-mode-hook)


(require 'functions) ;; personal defuns
(require 'mappings)  ;; personal key mappings

;; init.el ends here