;; Today we are engaged in a final, all-out battle between communistic 
;; atheism and Christianity. The modern champions of communism have 
;; selected this as the time, and ladies and gentlemen, the chips are 
;; down — they are truly down.
;; - Senator Joseph McCarthy
(defun color-theme-hellacious-j ()
  (interactive)
  (color-theme-install
   '(color-theme-hellacious-j
      ((background-color . "#1c1c1c")
      (background-mode . light)
      (border-color . "#000000")
      (cursor-color . "#33ea1a")
      (foreground-color . "#ffffff")
      (mouse-color . "black"))
     (fringe ((t (:background "#000000"))))
     (mode-line ((t (:foreground "#ffffff" :background "#542121"))))
     (region ((t (:background "#2e4a56"))))
     (font-lock-builtin-face ((t (:foreground "#bc98fb"))))
     (font-lock-comment-face ((t (:foreground "#5d734a"))))
     (font-lock-function-name-face ((t (:foreground "#cb6767"))))
     (font-lock-keyword-face ((t (:foreground "#fefb95"))))
     (font-lock-string-face ((t (:foreground "#76c1f9"))))
     (font-lock-type-face ((t (:foreground"#f64c4c"))))
     (font-lock-variable-name-face ((t (:foreground "#62f9aa"))))
     (minibuffer-prompt ((t (:foreground "#0aa4f0" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-hellacious-j)