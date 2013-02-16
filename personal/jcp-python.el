;; emacs-for-python
;; https://github.com/gabrielelanaro/emacs-for-python

;; Load everything from emacs-for-python at once:
;; (load-file "~/.emacs.d/plugins/emacs-for-python/epy-init.el")

;; Load emacs-for-python packages individually:
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-for-python/") ;; tell where to load the various files
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
(require 'epy-nose)       ;; For nose integration

;; Setup the linter
(epy-setup-checker "pyflakes %f")

;; Highlights different levels of indentation
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

;; Turn on/off parens pairing. On by default. Set skeleton-pair to nil to turn it off.
;; (setq skeleton-pair nil)

;; Better autocomplete for python
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

;; Line highlighting
(global-hl-line-mode t)
;; change with the color that you like
;; for a list of colors: http://raebear.net/comp/emacscolors.html
(set-face-background 'hl-line "black")

;; ipython configuration
(epy-setup-ipython)

;; django snippets
(epy-django-snippets)

(provide 'jcp-python)
