;; mappings.el
;; John Pena (john.pena@gmail.com)

;; User defined key mappings
;; Note that some mappings are defined in the 'functions.el' file for custom functions

;; Remap some keys to their OSX equivalent
(global-set-key "\M-z" 'undo)  ;; Undo

;; I occasionally hit C-x f instead of C-x C-f to find a file
(global-set-key "\C-x\ f" 'ido-find-file)
(global-set-key "\C-c\C-f" 'ido-find-file)

;; Map meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)


;; Etc
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-l" 'goto-line)

;; Region Indenting
(global-set-key "\M-\]" 'indent-region)

;; Anything! I love this thing.
(global-set-key (quote [(meta return)]) 'anything)

(windmove-default-keybindings) ;; Shift+direction keybindings

(global-set-key "\C-p" 'replace-string)

(global-set-key [f1] 'ns-toggle-fullscreen)

(provide 'mappings)

;; mappings.el ends here