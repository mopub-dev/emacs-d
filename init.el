;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; .emacs                                    ;;
;; John Pena (john.pena@alumni.duke.edu)     ;;
;; -- Created in emacs --                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Imports 
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path 
	     (concat dotfiles-dir "yasnippet"))
(add-to-list 'load-path
	     (concat dotfiles-dir "auto-complete"))
(add-to-list 'load-path
	     (concat dotfiles-dir "plugins"))


;; initialize other .el files within .emacs.d
(require 'functions)
(require 'mappings)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; yasnippet
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "yasnippet/snippets"))
(setq yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))


;; Auto-completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
	     (concat dotfiles-dir "auto-complete/ac-dict"))
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


;; Auto-fill-mode for python-mode only for comments
(add-hook 'python-mode-hook
	  (lambda ()
	    (auto-fill-mode 1)
	    (set (make-local-variable 'fill-nobreak-predicate)
		 (lambda ()
		   (not (eq (get-text-property (point) 'face)
			    'font-lock-comment-face))))))


;; Colors!
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-charcoal-black)
(set-cursor-color "#fff000")


;; set the size of the frame
(setq initial-frame-alist '((width . 87) (height . 42)))


;; display the time
(display-time)


;; ido.el support.
;; ido adds some functionality to buffer/file finding, its really useful
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; set the meta key to command on OSX (its set to 'option' in emacs23)
(setq mac-command-modifier 'meta)

;; turn off the bell and set it to visible
(setq visible-bell t); Parentheses Pairing
(setq skeleton-pair t)

(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)

;; Open Next Line
;;(require 'open-next-line)

;; Eshell tweaks
;; Visual commands like ipython
(add-hook
 'eshell-mode-hook
  (lambda ()
    (setq
     eshell-visual-commands
     (append
      '("mutt" 
	"vim" 
	"screen" 
	"lftp" 
	"ipython" 
	"telnet"
	"ssh")
       eshell-visual-commands))))


;; python compiling

(defun my-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)

(local-set-key "\C-c\C-c" 'my-compile)

;; Flymake for python configuration
(require 'python-flymake)

(require 'smart-operator)

