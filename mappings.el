;; mappings.el
;; John Pena (john.pena@gmail.com)

;; User defined key mappings
;; Note that some mappings are defined in the 'functions.el' file for custom functions

;; Undo
(global-set-key "\M-z" 'undo)

;; Map meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\M-g\M-g" 'goto-line)

(windmove-default-keybindings) ;; Shift+direction keybindings

(provide 'mappings)