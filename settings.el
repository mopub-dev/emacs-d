;; My settings ;;

;;;;;;;;;;;;;;;;;;
;; ERC Settings ;;
;;;;;;;;;;;;;;;;;;

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

; end erc settings

;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode Settings ;;
;;;;;;;;;;;;;;;;;;;;;;;

(setq-default org-startup-indented t)

; end org-mode settings


;;;;;;;;;;;;;;;;;;;;
;; Other Settings ;;
;;;;;;;;;;;;;;;;;;;;

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

(tooltip-mode -1)
(setq tooltip-use-echo-area t)
0.

;; Set up tags
(setq tags-file-name "~/TAGS")
(global-set-key (kbd "<f5>") 'find-tag)

;; Deleted files go to the trash
(setq delete-by-moving-to-trash t)

;; Show changes when asking to save
(highlight-changes-mode)

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

(provide 'settings)