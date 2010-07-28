;; mappings.el
;; John Pena (john.pena@gmail.com)

;; User defined key mappings
;; Note that some mappings are defined in the 'functions.el' file for custom functions

;; Remap some keys to their OSX equivalent
(global-set-key "\M-z" 'undo)  ;; Undo
;;(global-set-key "\M-c" 'copy) 
;;(global-set-key "\M-x" 'cut)
;;(global-set-key "\M-v" 'yank)


(global-set-key "\C-x f" 'find-file)

;; Map meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


;; Indent / De-indent blocks
;; (global-set-key "\C-[" 'indent-region)
;; (global-set-key "\C-]" ')

;; Etc
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\M-g\M-g" 'goto-line)

(windmove-default-keybindings) ;; Shift+direction keybindings

(provide 'mappings)