;; Stop scss-mode from compiling and saving every fucking file on a .scss save
;; what the fuck, seriously
(setq scss-compile-at-save nil)


;; Stops flymake from checking xml/html files
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

;; extra config
;; (unwind-protect
;;     (load-file "~/.emacs.d/plugins/nxhtml/autostart.el")
;;   (message "nxhtml autostart fucked up"))


(provide 'jcp-htmlcss)
