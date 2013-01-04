;;;;;;;;;;;;;;;;;;
;; Key Bindings ;;
;;;;;;;;;;;;;;;;;;

(require 'jcp-functions)

;; dpsastes
(global-set-key "\C-cd" 'dpaste-region)

;; Remap some keys to their OSX equivalent
(global-set-key "\M-z" 'undo)

;; ace jump
(global-set-key (kbd "C-j") 'ace-jump-line-mode)
(global-set-key (kbd "C-c C-j") 'ace-jump-word-mode)
(global-set-key (kbd "C-c C-c C-j") 'ace-jump-char-mode)

;; vim-like movement
(global-set-key "\M-h" 'backward-char)
(global-set-key "\M-j" 'next-line)
(global-set-key "\M-k" 'previous-line)
(global-set-key "\M-l" 'forward-char)

;; Map smex meta to c-x c-m and c-c c-m
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-x\C-n" 'smex)
(global-set-key "\C-c\C-m" 'smex-major-mode-commands)

;; Resetting killers
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Movement
(windmove-default-keybindings) ;; Shift+direction keybindings
(global-set-key "\C-f" 'forward-word)
(global-set-key "\C-b" 'backward-word)
(global-set-key "\M-f" 'forward-char)
(global-set-key "\M-b" 'backward-char)

(global-set-key (kbd "M-<left>") 'beginning-of-buffer)
(global-set-key (kbd "M-<right>") 'end-of-buffer)
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)

;; autocomplete
(global-set-key (kbd "C-/") 'hippie-expand)

;; Font size
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; Show occurances of a regexp
(global-set-key "\C-c\C-o" 'occur)

;; goto line... this comment is unnecessary
(global-set-key "\C-c\C-l" 'goto-line)

;; Expand-region
(global-set-key (kbd "C-@") 'er/expand-region)

;; Helm - like spotlight in emacs
(global-set-key (quote [(meta return)]) 'helm)

;; Killring browser
(global-set-key (kbd "C-c k") 'browse-kill-ring)
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; override C-p with string replacing
(global-set-key (kbd "C-p") 'replace-string)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Mimic textmate features (from textmate.el)
(global-set-key (kbd "M-t") 'textmate-goto-file)
(global-set-key (kbd "M-S-t") 'textmate-goto-file)


;; F1 - F12
(global-set-key [f1] 'toggle-selective-display)
(global-set-key [f2] 'ansi-term)
(global-set-key [f3] (lambda () (interactive) (eshell t)))
(global-set-key [f4] 'browse-kill-ring)
;; (global-set-key [f5] 'this is set earlier)
(global-set-key [f7] 'kmacro-start-macro)
(global-set-key [f8] 'kmacro-call-macro)
(global-set-key [f9] 'kmacro-end-macro)
(global-set-key [f10] '(lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key [f11] '(lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key [f12] '(lambda () (interactive) (find-file "~/dotfiles/bashrc")))

;; defined in modules/jcp-functions.el
(global-set-key "\C-d" 'duplicate-line)
(global-set-key "\C-xt" 'tag-word-or-region)

(provide 'jcp-keys) 
