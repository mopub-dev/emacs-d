;;;;;;;;;;;;;;;;;;;;;;;;;
;; john.pena@gmail.com ;;
;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;
;; Setup ;;
;;;;;;;;;;;

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
(add-to-list 'load-path (concat plugins-dir "scala-mode/"))

(require 'cl)

(require 'ansi-color)
(require 'anything)
(require 'browse-kill-ring)
(require 'color-theme)
(require 'dpaste)
(require 'ffap)
(require 'find-recursive)
(require 'hexrgb)
(require 'highlight-current-line)
(require 'ido)
(require 'inf-ruby)
(require 'jabber)
(require 'linum)
(require 'org-install)
(require 'python)
(require 'rails)
(require 'recentf)
(require 'ruby-electric)
(require 'ruby-mode)
(require 'saveplace)
(require 'scss-mode)
(require 'snippet)
(require 'speedbar)
(require 'uniquify)
(require 'yaml-mode)
(require 'yasnippet)


(require 'functions) ;; personal

(load-file "~/.emacs.d/plugins/nxhtml/autostart.el")
(load "scala-mode-auto.el")
;;;;;;;;;;;;;;
;; Settings ;;
;;;;;;;;;;;;;;

;; auto-modes
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; DISPLAY

;; syntax highlight everywhere
(global-font-lock-mode t)

;; color theme-ing
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-railscasts)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#333") ;; To customize the background color

(create-fontset-from-fontset-spec
 (concat
  "-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,"
  "ascii:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman,"
  "latin-iso8859-1:-apple-monaco-medium-r-normal--12-100-*-*-m-100-mac-roman"))

(setq default-frame-alist '((font . "fontset-monaco")))

;;(if (eq system-type 'darwin)
   ;;  (set-face-font 'default "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-fontset-startup"))

;; Set the size of the font. Height is 10x normal font size. So, 12pt = 120.
(set-face-attribute 'default nil :height 100)

;; window transparency
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95 50))
(add-to-list 'default-frame-alist '(alpha 95 50))

(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(95 50))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; MODE SETTINGS ;;

;; js2-mode settings
(autoload 'js2-mode "js2" nil t)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(setq js2-basic-offset 2)
(setq js2-use-font-lock-faces t)

;; nXHTML (has django stuff)
(setq mumamo-background-colors nil)

;; Highlight selection
    (transient-mark-mode t)


;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; uniquify renames buffers to be unique, so no more index.html | index.html<2>
(setq uniquify-buffer-name-style 'forward)

;; Org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq-default org-startup-indented t)

;; dpsastes
(global-set-key "\C-cd" 'dpaste-region)

;; jabber
(setq jabber-account-list
      '(("john.pena@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;; Turn off backup files (those fucking annoying foo~ files)
(setq make-backup-files nil)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; skip the gnu splash screen, take me to scratch
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; Display the time in the minibuffer
(display-time)

;; yasnippet (textmate-like snippets)
(yas/initialize)
(yas/load-directory (concat plugins-dir "yasnippet/snippets/"))
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))

;; Line and column numbers in the bar above the minibuffer
(line-number-mode 1)
(column-number-mode 1)

;; Set the meta key to command on OSX (its set to 'option' in emacs23)
(setq mac-command-modifier 'meta)

;; Turn off the audio bell, replace it with a visual bell.
(setq visible-bell t)
(setq skeleton-pair t)

;; Turn off toolbar/menubar/scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Return adds a newline AND indents
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Instead of tooltips opening in another fucking frame (incredibly annoying and disruptive),
;; display them in the echo area. Why this is not default, I don't understand.
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; set the default frame size
(setq initial-frame-alist '((width . 170) (height . 48)))

;; stop emacs from dividing the frame to display tooltips
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; Set up tags
(setq tags-file-name "~/TAGS")
(global-set-key (kbd "<f5>") 'find-tag)

;; Deleted files go to the trash
(setq delete-by-moving-to-trash t)

;; Set the path to the one you'd see in Terminal.app
;; This is hugely helpful when you're using carbon emacs on OSX.
;; Only tested in emacs 23.
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
         (replace-regexp-in-string "[[:space:]\n]*$" ""
                                   (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))

;; erc
(erc-timestamp-mode t)
(erc-match-mode t) ;; Notify me if someone calls me
(setq erc-server "irc.freenode.net"
      erc-port 6667
      erc-nick "streblo"
      erc-user-full-name "Wub Womper"
      erc-email-userid "streblo"
      erc-prompt-for-password t
      erc-fill-prefix "      "
      erc-auto-query t
      erc-keywords '("streblo" "geckimo", "409advisor", "409", "409A")
      erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "%H:%M "
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-log-channels t
      erc-log-channels-directory "~/.irclogs"
      erc-log-insert-log-on-open t
      )


;;;;;;;;;;;;;;;;;;
;; Key Bindings ;;
;;;;;;;;;;;;;;;;;;

;; Remap some keys to their OSX equivalent
(global-set-key "\M-z" 'undo)

;; Map meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


;; Movement
(windmove-default-keybindings) ;; Shift+direction keybindings

;; (global-set-key "\M-left" 'beginning-of-buffer)
;; (global-set-key "\M-right" 'end-of-buffer)
;; (global-set-key "\M-up" 'scroll-up)
;; (global-set-key "\M-down" 'scroll-down)

;; autocomplete
(global-set-key (kbd "C-/") 'hippie-expand)

;; Font size
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; Show occurances of a regexp
(global-set-key "\C-c\C-o" 'occur)

;; goto line... this comment is unnecessary
(global-set-key "\C-c\C-l" 'goto-line)

;; Anything! I love this thing.
(global-set-key (quote [(meta return)]) 'anything)

;; Killring browser
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; override C-p with string replacing
(global-set-key "\C-p" 'replace-string)

(global-set-key (kbd "C-x g") 'magit-status)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-c C-s") 'multi-occur-in-this-mode)

;; F1 - F12
(global-set-key [f1] 'ns-toggle-fullscreen)
(global-set-key [f2] 'ansi-term)
(global-set-key [f3] (lambda () (interactive) (eshell t)))
(global-set-key [f4] 'browse-kill-ring)
;; (global-set-key [f5] 'something)
(global-set-key [f6] 'kmacro-start-macro)
(global-set-key [f7] 'kmacro-call-macro)
(global-set-key [f8] 'kmacro-end-macro)
(global-set-key [f9] '(lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key [f10] '(lambda () (interactive) (load-file "~/.emacs.d/init.el")))

;;;;;;;;;;;;;
;; Aliases ;;
;;;;;;;;;;;;;

(defalias 'pym 'python-mode)
(defalias 'jsm 'js-mode)
(defalias 'rbm 'ruby-mode)
(defalias 'hm 'nxhtml-mumamo-mode)
(defalias 'cssm 'scss-mode)
(defalias 'tm 'text-mode)
(defalias 'ssm 'shell-script-mode)
(defalias 'elm 'emacs-lisp-mode)
(defalias 'wsm 'whitespace-mode)
(defalias 'gwsm 'global-whitespace-mode)
(defalias 'om 'org-mode)


;; thats all!
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