(require 'auto-complete)
(require 'cl)
(require 'color-theme)
(require 'helm-config)
(require 'ido)
(require 'package)
(require 'smex)

(message "Loading jcp core module")

;;;;;;;;;;;;
;; SYSTEM ;;
;;;;;;;;;;;;

;; Set the path to the one you'd see in Terminal.app
;; This is hugely helpful when you're using carbon emacs on OSX.
;; Only tested in emacs 23/24.
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string
           "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path
          (split-string
           path-from-shell
           path-separator))))

;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell. If you're using homebrew modifying the PATH is essential.
(when (equal system-type 'darwin)
  (progn
    (set-exec-path-from-shell-PATH)
    (push "/usr/local/bin" exec-path)))

(when (equal emacs-major-version 24)         
  (eval-after-load "bytecomp"
    '(add-to-list
      'byte-compile-not-obsolete-vars
      'font-lock-beginning-of-syntax-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list
      'byte-compile-not-obsolete-vars
      'font-lock-beginning-of-syntax-function)))

;; Deleted files go to the trash
(setq delete-by-moving-to-trash t)

;;;;;;;;;;;;;
;; PACKAGE ;;
;;;;;;;;;;;;;

(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (concat parent-dir f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; add the first level subfolders of vendor automatically
(add-subfolders-to-load-path vendor-dir)

(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))


;;;;;;;;;;;;;
;; DISPLAY ;;
;;;;;;;;;;;;;

;; syntax highlight everywhere
(global-font-lock-mode t)

;; color theme-ing
(setq color-theme-is-global t)
(color-theme-initialize)
(if window-system
    (color-theme-jcp-tres) ;; ns
    (color-theme-ir-black)) ;; term

;; (highlight-current-line-on t)

(set-face-font 'default "-outline-Bitstream Vera Sans Mono-normal-r-normal-normal-11-90-96-96-c-*-iso8859-1")

;; window transparency

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;;(set-frame-parameter (selected-frame) 'alpha '(95 50))
;;(add-to-list 'default-frame-alist '(alpha 95 50))
;;(global-set-key (kbd "C-c t") 'toggle-transparency)


;;;;;;;;;;;;;;;;;;;;;;;;
;; HELM CONFIGURATION ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(defvar helm-dired-history-variable nil)

;;;###autoload
(defun helm-dired-history-update()
  "update variable `helm-dired-history-variable'."
  (setq helm-dired-history-variable
        (delete-dups (delete (dired-current-directory) helm-dired-history-variable)))
  (setq helm-dired-history-variable
        (append (list (dired-current-directory)) helm-dired-history-variable)))

;;when you open dired buffer ,update `helm-dired-history-variable'.
;;;###autoload
(add-hook 'dired-after-readin-hook 'helm-dired-history-update)

;;;###autoload
(defvar helm-c-source-dired-history
  '((name . "Dired History:")
    (candidates . helm-dired-history-variable)
    (action . (("Go" . (lambda(candidate) (dired candidate)))))))

;;;###autoload
(defun helm-dired-history-view()
  "call `helm' to show dired history."
  (interactive)
  (let ((helm-execute-action-at-once-if-one t)
        (helm-quit-if-no-candidate
         (lambda () (message "No history record."))))
    (helm '(helm-c-source-dired-history)
              ;; Initialize input with current symbol
              ""  nil nil)))

;;;;;;;;;
;; ERC ;;
;;;;;;;;;

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

;;;;;;;;;;;;;
;; EDITING ;;
;;;;;;;;;;;;;

;; Highlight selection
(transient-mark-mode t)

;; delete the selection with a keypress
(delete-selection-mode t)

; set tab width to 4 for all buffers
(setq-default tab-width 4) 

; always replace tabs with spaces
(setq-default indent-tabs-mode nil)

;; Return adds a newline AND indents
(define-key global-map (kbd "RET") 'newline-and-indent)

;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; autocompletion
(global-auto-complete-mode t)
(setq ac-auto-start t)                  ;automatically start
(setq ac-dwim t)                        ;Do what i mean
(setq ac-override-local-map nil)        ;don't override local map
; autocomplete in the following modes:
(setq ac-modes
      '(emacs-lisp-mode
        lisp-interaction-mode
        lisp-mode scheme-mode
        c-mode
        cc-mode
        c++-mode
        java-mode
        perl-mode
        cperl-mode
        python-mode
        ruby-mode
        ecmascript-mode
        javascript-mode
        js2-mode
        php-mode
        css-mode
        makefile-mode
        sh-mode
        fortran-mode
        f90-mode
        ada-mode
        xml-mode
        sgml-mode
        haskell-mode
        literate-haskell-mode
        emms-tag-editor-mode
        asm-mode
        org-mode))

;; Volatile highlights shows 


;;;;;;;;;;;;;;;;;;
;; SAVING FILES ;;
;;;;;;;;;;;;;;;;;;

;; saveplace remembers your location in a file when saving files
(setq save-place-file (concat user-emacs-directory "saveplace"))
;; activate it for all buffers
(setq-default save-place t)
(require 'saveplace)

;; savehist keeps track of some history
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (concat user-emacs-directory "savehist"))
(savehist-mode t)

;; save recent files
(setq recentf-save-file (concat user-emacs-directory "recentf")
      recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode t)

;; time-stamps
;; when there's "Time-stamp: <>" in the first 10 lines of the file
(setq time-stamp-active t
      ;; check first 10 buffer lines for Time-stamp: <>
      time-stamp-line-limit 10
      time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%u)") ; date format
(add-hook 'write-file-hooks 'time-stamp) ; update when saving


;;;;;;;;;;;;;;;;
;; MISC SETUP ;;
;;;;;;;;;;;;;;;;

;; initialize smex (like ido but for M-x commands)
(smex-initialize)

;; fixes missing character issues in ansi-term
(setq ansi-color-for-comint-mode t) 

;; midnight setup. kind of a cron/cleanup mode.
(setq midnight-mode 't)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; uniquify renames buffers to be unique, so no more index.html | index.html<2>
(setq uniquify-buffer-name-style 'forward)

;; Turn off backup files (those fucking annoying foo~ files)
(setq make-backup-files nil)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; skip the gnu splash screen, take me to scratch
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

;; Turn off toolbar/menubar/scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; display them in the echo area. Why this is not default, I don't understand.
(require 'tooltip)
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; set the default frame size
(setq initial-frame-alist '((width . 170) (height . 48)))

;; Set up tags
(setq tags-file-name "~/TAGS")


(provide 'jcp-core)
