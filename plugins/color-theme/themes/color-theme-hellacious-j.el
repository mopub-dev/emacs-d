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
      (background-mode . dark)
      (border-color . "#000000")
      (cursor-color . "#33ea1a")
      (foreground-color . "#ffffff")
      (mouse-color . "black"))
     (fringe ((t (:background "#000000"))))
     (mode-line ((t (:foreground "#ffffff" :background "#542121"))))
     (region ((t (:background "#2e4a56"))))
     (font-lock-builtin-face ((t (:foreground "#35C44B"))))
     (font-lock-comment-face ((t (:foreground "#636575"))))
     (font-lock-function-name-face ((t (:foreground "#EB1B00"))))
     (font-lock-keyword-face ((t (:foreground "#FCD360" :bold t))))
     (font-lock-number-face ((t (:foreground "#FF00C3" :bold t))))
     (font-lock-string-face ((t (:foreground "#76c1f9"))))
     (font-lock-type-face ((t (:foreground"#f64c4c"))))
     (font-lock-variable-name-face ((t (:foreground "#62f9aa"))))
     (minibuffer-prompt ((t (:foreground "#0aa4f0" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))

(provide 'color-theme-hellacious-j)