;; CSS and Rainbow modes
(defun all-scss-modes()
  (scss-mode)
  (rainbow-mode))

;; Stop scss-mode from compiling and saving every fucking file on a .scss save
;; what the fuck, seriously
(setq scss-compile-at-save nil)

;; Stops flymake from checking xml/html files
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

;; extra config
;; (unwind-protect
;;     (load-file "~/.emacs.d/plugins/nxhtml/autostart.el")
;;   (message "nxhtml autostart fucked up"))

;; Load both major and minor modes in one call based on file type
(add-to-list 'auto-mode-alist '("\\.scss\\'" . all-scss-modes))
(add-to-list 'auto-mode-alist '("\\.html\\'" . django-html-mumamo-mode))

(global-hl-line-mode nil)

(provide 'jcp-htmlcss)
