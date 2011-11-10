;;;;;;;;;;;;;;;;;;;;;;;;;
;; john.pena@gmail.com ;;
;;;;;;;;;;;;;;;;;;;;;;;;;


;; TABLE OF CONTENTS ;;

;; 1. Setup
;;    a. Sets up the directory structure
;;    b. Loads all of the plugins
;;       (If you want to add more plugins, add the.el file to .emacs.d/plugins)
;;       (You should be able to just require `the-plugin and it'll load.
;;    c. Bootstraps some other stuff in functions.el
;; 2. General settings
;;    a. mode startup for different file extensions
;;    b. some display stuff
;;    c. mode-specific settings and hooks
;;    d. emacs settings
;; 3. Key Bindings
;; 4. Aliases


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
(add-to-list 'load-path (concat plugins-dir "pymacs/"))
(add-to-list 'load-path (concat plugins-dir "rails/"))
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat plugins-dir "color-theme/"))
(add-to-list 'load-path (concat plugins-dir "org/lisp"))
(add-to-list 'load-path (concat plugins-dir "org/contrib/lisp"))
(add-to-list 'load-path (concat plugins-dir "scala-mode/"))

(require 'cl) ;; a ton of packages need this

(require 'ace-jump-mode)
(require 'auto-complete)
(require 'ansi-color)
(require 'anything)
(require 'browse-kill-ring)
(require 'color-theme)
(require 'coffee-mode)
(require 'dpaste)
(require 'ffap)
(require 'find-recursive)
(require 'git)
(require 'hexrgb)
(require 'highlight-current-line)
(require 'ido)
(require 'inf-ruby)
(require 'less-mode)
(require 'linum)
(require 'markdown-mode)
(require 'org-install)
(require 'python)
(require 'rails)
(require 'recentf)
(require 'ruby-electric)
(require 'ruby-mode)
(require 'saveplace)
(require 'scss-mode)
(require 'smex)
(require 'snippet)
(require 'speedbar)
(require 'uniquify)
(require 'yaml-mode)
(require 'yasnippet)

(require 'functions) ;; personal

(load-file "~/.emacs.d/plugins/nxhtml/autostart.el")
(load "scala-mode-auto.el")


;;;;;;;;;;;;;;;;;;;;;;
;; General Settings ;;
;;;;;;;;;;;;;;;;;;;;;;

;; MAJOR MODE LOADING ;;

(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))


;; DISPLAY SETTINGS ;;

;; syntax highlight everywhere
(global-font-lock-mode t)

;; color theme-ing
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-holy-fuck)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#333") ;; To customize the current line's background color

;; (if (eq system-type 'darwin)
;;     (set-face-font 'default "-apple-Monaco-medium-normal-normal-*-*-*-*-*-m-0-fontset-startup"))

;; ;; Set the size of the font. Height is 10x normal font size. So, 12pt = 120.
;; (set-face-attribute 'default nil :height 110)

;;(set-face-font 'default "-apple-menlo-medium-r-normal--11-110-72-72-m-110-iso10646-1")

(set-face-font 'default "-outline-Bitstream Vera Sans Mono-normal-r-normal-normal-11-90-96-96-c-*-iso8859-1")

;; window transparency
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(95 50))
(add-to-list 'default-frame-alist '(alpha 95 50))
(global-set-key (kbd "C-c t") 'toggle-transparency)


;; MODE SETTINGS ;;

;; initialize smex (like ido but for M-x commands)
(smex-initialize)

;; ansi-term
(setq ansi-color-for-comint-mode t) ;; fixes missing character issues

;; js2-mode settings
(autoload 'js2-mode "js2" nil t)
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(setq js2-basic-offset 1)
(setq js2-use-font-lock-faces t)

;; python
(add-hook 'python-mode-hook 'my-python-mode-hook)

;; nXHTML (has django stuff)
(setq mumamo-background-colors nil)

;; Org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq-default org-startup-indented t)

(setq journal-file "~/journal.org")

(global-set-key (kbd "C-c j") 'start-journal-entry)

;; dpsastes
(global-set-key "\C-cd" 'dpaste-region)

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


;; EMACS SETTINGS ;;

;; Highlight selection
(transient-mark-mode t)

;; Line numbers everywhere
;; (global-linum-mode 1)

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; autocompletion
(global-auto-complete-mode t)
(setq ac-auto-start t)                  ;automatically start
(setq ac-dwim t)                        ;Do what i mean
(setq ac-override-local-map nil)        ;don't override local map
(setq ac-modes
      '(emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode
                        c-mode cc-mode c++-mode java-mode
                        perl-mode cperl-mode python-mode ruby-mode
                        ecmascript-mode javascript-mode php-mode css-mode
                        makefile-mode sh-mode fortran-mode f90-mode ada-mode
                        xml-mode sgml-mode
                        haskell-mode literate-haskell-mode
                        emms-tag-editor-mode
                        asm-mode
                        org-mode))


;; uniquify renames buffers to be unique, so no more index.html | index.html<2>
(setq uniquify-buffer-name-style 'forward)


(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers

;; Turn off backup files (those fucking annoying foo~ files)
(setq make-backup-files nil)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; skip the gnu splash screen, take me to scratch
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; Display the time in the minibuffer
;; (display-time)

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


;;;;;;;;;;;;;;;;;;
;; Key Bindings ;;
;;;;;;;;;;;;;;;;;;

;; ace jump
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Remap some keys to their OSX equivalent
(global-set-key "\M-z" 'undo)

;; vim-like movement
(global-set-key "\M-h" 'backward-char)
(global-set-key "\M-j" 'next-line)
(global-set-key "\M-k" 'previous-line)
(global-set-key "\M-l" 'forward-char)

;; Map smex meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex-major-mode-commands)

;; Resetting killers
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Movement
(windmove-default-keybindings) ;; Shift+direction keybindings
(global-set-key "\C-f" 'forward-word)
(global-set-key "\C-b" 'backward-word)
(global-set-key "\M-f" 'forward-char)
(global-set-key "\M-b" 'backward-char)

(global-set-key (kbd "M-<left>") 'beginning-of-buffer)
(global-set-key (kbd "M-<right>") 'end-of-buffer)
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)

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

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Reverts a buffer from what's on disk. Nice for switching branches.
(global-set-key [(super r)] #'(lambda () (interactive) (revert-buffer t t nil)))

;; F1 - F12
(global-set-key [f1] 'ns-toggle-fullscreen)
(global-set-key [f2] 'ansi-term)
(global-set-key [f3] (lambda () (interactive) (eshell t)))
(global-set-key [f4] 'browse-kill-ring)
;; (global-set-key [f5] 'this is set earlier)
(global-set-key [f7] 'kmacro-start-macro)
(global-set-key [f8] 'kmacro-call-macro)
(global-set-key [f9] 'kmacro-end-macro)
(global-set-key [f10] '(lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key [f11] '(lambda () (interactive) (load-file "~/.emacs.d/init.el")))


;; Parens matching. I should bind this key to something else since % is used in nxhtml-django-mode

;;(global-set-key "%" 'match-paren)

;; (defun match-paren (arg)
;;   "Go to the matching paren if on a paren; otherwise insert %."
;;   (interactive "p")
;;   (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;         ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;         (t (self-insert-command (or arg 1)))))

;;;;;;;;;;;;;
;; Aliases ;;
;;;;;;;;;;;;;

; modes
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

; commands
(defalias 'cr 'comment-region)
(defalias 'ucr 'uncomment-region)

;; thats all!
;; init.el ends here

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js2-basic-offset 4)
 '(scheme-program-name "mzscheme")
 '(standard-indent 4)
'(warning-minimum-level :error))