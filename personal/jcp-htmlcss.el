;; Stops flymake from checking xml/html files
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

;; extra config
;; (unwind-protect
;;     (load-file "~/.emacs.d/plugins/nxhtml/autostart.el")
;;   (message "nxhtml autostart fucked up"))


(provide 'jcp-htmlcss)
