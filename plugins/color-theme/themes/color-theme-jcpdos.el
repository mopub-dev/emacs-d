(defun jcpdos ()
  "Theme generated by Sweyla: http://themes.sweyla.com/seed/569772/"
  (interactive)
  (color-theme-install
   '(jcpdos
     ((background-color . "#020300")
      (foreground-color . "#FFFFFF")
      (background-mode . dark)
      (border-color . "#323232")
      (cursor-color . "#FFFFFF")
      (mouse-color . "#323232"))
     (mode-line ((t (:foreground "#FFFFFF" :background "#323232"))))
     (region ((t (:background "#323232"))))

     (font-lock-comment-face ((t (:foreground "#FF5574"))))
     (font-lock-constant-face ((t (:foreground "#FEEEB6"))))
     (font-lock-builtin-face ((t (:foreground "#DFE5CC"))))
     (font-lock-function-name-face ((t (:foreground "#FFC272"))))
     (font-lock-variable-name-face ((t (:foreground "#FFA15D"))))
     (font-lock-keyword-face ((t (:foreground "#FFF8BB"))))
     (font-lock-string-face ((t (:foreground "#FFD5C1"))))
     (font-lock-doc-string-face ((t (:foreground "#FFD5C1"))))
     (font-lock-type-face ((t (:foreground "#FFD8FF"))))
     )))

(provide 'jcpdos)