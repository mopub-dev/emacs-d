
; ============
; = Settings =
; ============


;; Turn off backup files (those fucking annoying foo~ files)
(setq make-backup-files nil)

;; Fuck you for making me type in 'yes' or 'no' instead of 'y' or 'n'
(fset 'yes-or-no-p 'y-or-n-p) 

;; Shut the fuck up when I load emacs
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; turn off toolbar/menubar/scrollbars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; display the time
(display-time)

;; line and column numbers in the bar above the minibuffer
(line-number-mode 1)
(column-number-mode 1)

;; set the meta key to command on OSX (its set to 'option' in emacs23)
(setq mac-command-modifier 'meta)

;; turn off the bell and set it to visible
(setq visible-bell t)
(setq skeleton-pair t)

;; set the default font
(set-face-font 'default "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;; set the default font size. height is 10x the normal font
;; size. so :height 100 is 10pt 
(set-face-attribute 'default nil :height 115)

;; set the size of the frame. i should come up with a better
;; way of doing this. 
(setq initial-frame-alist '((width . 170) (height . 48)))

(provide 'mysettings)