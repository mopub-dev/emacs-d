;; mappings.el
;; John Pena (john.pena@gmail.com)

;; User defined key mappings
;; Note that some mappings are defined in the 'functions.el' file for custom functions

;; Remap some keys to their OSX equivalent
(global-set-key "\M-z" 'undo)  ;; Undo

;; I occasionally hit C-x f instead of C-x C-f to find a file
(global-set-key "\C-x\ f" 'ido-find-file)
(global-set-key "\C-c\C-f" 'ido-find-file)

(global-set-key (kbd "C-/") 'hippie-expand)

;; Map meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; Etc
(global-set-key "\C-c\C-o" 'occur)
(global-set-key "\C-c\C-l" 'goto-line)

;; Region Indenting
(global-set-key "\M-\]" 'indent-region)

;; Anything! I love this thing.
(global-set-key (quote [(meta return)]) 'anything)

(windmove-default-keybindings) ;; Shift+direction keybindings

(global-set-key "\C-p" 'replace-string)

(global-set-key (kbd "C-x g") 'magit-status)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key [f1] 'ns-toggle-fullscreen)
(global-set-key [f2] 'ansi-term)
(global-set-key [f3] (lambda () (interactive) (eshell t)))
(global-set-key [f4] 'indent-buffer)
(global-set-key [f6] 'compile)


;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)


(provide 'mappings)

;; mappings.el ends here