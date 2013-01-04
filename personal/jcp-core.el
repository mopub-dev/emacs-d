(message "Loading jcp core module")

(require 'cl)
(require 'color-theme)
(require 'find-recursive)
(require 'highlight-current-line)
(require 'ido)
(require 'linum)
(require 'markdown-mode)
(require 'midnight)
(require 'package)
(require 'package)
(require 'recentf)
(require 'speedbar)
(require 'uniquify)
(require 'workgroups)

;;;;;;;;;;;;;;;;;
;; SYSTEM SETUP;;
;;;;;;;;;;;;;;;;;

;; Set the path to the one you'd see in Terminal.app
;; This is hugely helpful when you're using emacs on OSX.
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

;; Not really used anymore because of el-get, but leaving it just in
;; case...
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))


;;;;;;;;;;;;;
;; DISPLAY ;;
;;;;;;;;;;;;;

;; Set the default frame size
(setq initial-frame-alist '((width . 170) (height . 48)))

;; Set the default major mode to markdown
(setq initial-major-mode 'markdown-mode)

;; syntax highlight everywhere
(global-font-lock-mode t)

;; color theme-ing
(setq color-theme-is-global t)
(color-theme-initialize)

;; only load this color theme if we're in a gui:
(load-file (concat personal-dir "color-theme-jcp-tres.el"))
(if window-system (color-theme-jcp-tres))


;; free from the hell of annoying buffers such like *Help*,
;; *Completions*, *compilation*, and etc.
;; https://github.com/m2ym/popwin-el
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; Turn off toolbar/menubar/scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;;;;;;;;;;;;
;; Aliases ;;
;;;;;;;;;;;;;

; modes
(defalias 'pym 'python-mode)
(defalias 'jsm 'js2-mode)
(defalias 'rbm 'ruby-mode)
(defalias 'cssm 'scss-mode)
(defalias 'tm 'text-mode)
(defalias 'ssm 'shell-script-mode)
(defalias 'elm 'emacs-lisp-mode)
(defalias 'wsm 'whitespace-mode)
(defalias 'gwsm 'global-whitespace-mode)

; commands
(defalias 'cr 'comment-region)
(defalias 'ucr 'uncomment-region)

;;;;;;;;;;;;;;;;
;; File Loads ;;
;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))

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

;;;;;;;;;;;;;
;; EDITING ;;
;;;;;;;;;;;;;

;; Highlight trailing whitespace
(setq-default show-trailing-whitespace t)

;; Highlight selection
(transient-mark-mode t)

;; delete the selection with a keypress
(delete-selection-mode t)

;; set tab width to 4 for all buffers
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
;; (global-auto-complete-mode t)
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

;;;;;;;;;;;;;;;;;;
;; SAVING FILES ;;
;;;;;;;;;;;;;;;;;;

;; Saveplace remembers your location in a file when saving files
(require 'saveplace)

;; Saveplace file location:
(setq save-place-file (concat user-emacs-directory "saveplace"))

;; Activate it for all buffers
(setq-default save-place t)

;; Savehist keeps track of some history
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every 20 seconds
      savehist-autosave-interval 20
      ;; file location:
      savehist-file (concat user-emacs-directory "savehist"))

;; Turn savehist on
(savehist-mode t)

;; Save recent files
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

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Scratch persistance
(require 'jcp-scratch-persist)
(load-persistent-scratch)
(push #'save-persistent-scratch kill-emacs-hook)

;; midnight setup. kind of a cron/cleanup mode.
(setq midnight-mode 't)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Clean up whitespace
(require 'jcp-functions)
(add-hook 'before-save-hook 'cleanup-buffer-safe)

;;;;;;;;;;;;;;;
;; Yasnippet ;;
;;;;;;;;;;;;;;;

(require 'yasnippet)
;; (yas/initialize)
(yas/load-directory (concat user-emacs-directory "personal/snippets/"))
(yas-global-mode 1)


;;;;;;;;;
;; Git ;;
;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/plugins/mo-git-blame")
(autoload 'mo-git-blame-file "mo-git-blame" nil t)
(autoload 'mo-git-blame-current "mo-git-blame" nil t)

;;;;;;;;;;;;;;;;
;; MINIBUFFER ;;
;;;;;;;;;;;;;;;;

;; initialize smex (like ido but for M-x commands)
(require 'smex)
(smex-initialize)

;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
(setq ido-create-new-buffer 'always) ;; make new buffers on the fly, dont ask to confirm

;; uniquify renames buffers to be unique, so no more index.html | index.html<2>
(setq uniquify-buffer-name-style 'forward)

;; Display the time in the minibuffer
(display-time)

;; Line and column numbers in the bar above the minibuffer
(line-number-mode 1)
(column-number-mode 1)


;;;;;;;;;;;;;;;;
;; MISC SETUP ;;
;;;;;;;;;;;;;;;;

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)

;; Deleted files go to the trash
(setq delete-by-moving-to-trash t)

;; Stop opening the debugger on error
(setq debug-on-error nil)
(setq-default debug-on-error nil)

;; fixes missing character issues in ansi-term
(setq ansi-color-for-comint-mode t)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Set the meta key to command on OSX (its set to 'option' in emacs23)
(setq mac-command-modifier 'meta)

;; Turn off the audio bell, replace it with a visual bell.
(setq visible-bell t)
(setq skeleton-pair t)

;; display them in the echo area. Why this is not default, I don't understand.
(require 'tooltip)
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;; Set up tags
(setq tags-file-name "~/TAGS")

;; display-graphic-p is true if you're in a graphics-enabled
;; emacs environment (ie, when you're not in a terminal).
(if (display-graphic-p)
    (progn
      (message "Loading graphic-only settings"))
  (progn
    (message "Loading terminal settings")
    (require 'pbcopy)
    (turn-on-pbcopy)
    (color-theme-zenburn)))

(provide 'jcp-core)
