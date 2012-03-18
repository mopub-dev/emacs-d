;;;;;;;;;;;;;;;;;;;;;;;;;
;; john.pena@gmail.com ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(message "Loading Emacs settings")

;; Set up all of the load directories.

(defvar emacs-dir (file-name-directory load-file-name)
  "Usually set to .emacs.d/ or emacs/, it's the directory we're in right now.")

(defvar plugins-dir (concat emacs-dir "plugins/")
  "All of the plugins that I didn't write go in here. This should only
  have non-ELPA modules.")

(defvar personal-dir (concat emacs-dir "personal/")
  "My personal configs.")

(defvar vendor-dir (concat emacs-dir "elpa/")
  "ELPA-installed plugins.")

;; add all this to the `load-path'
(add-to-list 'load-path emacs-dir)
(add-to-list 'load-path plugins-dir)
(add-to-list 'load-path personal-dir)

;; Load plugins ;;
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat plugins-dir "color-theme/"))
(add-to-list 'load-path (concat plugins-dir "pony-mode/"))
(add-to-list 'load-path (concat plugins-dir "helm/"))
(add-to-list 'load-path (concat plugins-dir "slime/"))

;; personal
;; don't change the order, jcp-keys uses defuns from all of these
;; packages
(require 'jcp-core)
(require 'jcp-functions)
(require 'jcp-python)
(require 'jcp-javascript)
(require 'jcp-htmlcss)
(require 'jcp-lisp)
(require 'jcp-ruby)
(require 'jcp-shell)
(require 'jcp-keys)


;; Load third party plugins
(require 'ace-jump-mode)
(require 'auto-complete)
(require 'ansi-color)
(require 'browse-kill-ring)
(require 'color-theme)
(require 'coffee-mode)
(require 'dpaste)
(require 'expand-region)
(require 'ffap)
(require 'find-recursive)
(require 'git)
(require 'hexrgb)
(require 'helm-config)
(require 'highlight-current-line)
(require 'ido)
(require 'inf-ruby)
(require 'less-mode)
(require 'linum)
(require 'markdown-mode)
(require 'midnight)
(require 'org-install)
(require 'package)
(require 'pony-mode)
(require 'python)
(require 'python-pep8)
(require 'rainbow-mode)
(require 'recentf)
(require 'ruby-electric)
(require 'ruby-mode)
(require 'saveplace)
(require 'scss-mode)
(require 'smex)
(require 'snippet)
(require 'speedbar)
(require 'textmate)
(require 'uniquify)
(require 'workgroups)
(require 'yaml-mode)

;; SLIME
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup)


;;;;;;;;;;;;;;;;;;;;;;
;; General Settings ;;
;;;;;;;;;;;;;;;;;;;;;;

;; CSS and Rainbow modes
(defun all-scss-modes()
  (scss-mode)
  (rainbow-mode))

;; Load both major and minor modes in one call based on file type
(add-to-list 'auto-mode-alist '("\\.scss$" . all-scss-modes))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.js$". js2-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))
(add-to-list 'auto-mode-alist '("bashrc$" . shell-script-mode))


;;;;;;;;;;;;;
;; Aliases ;;
;;;;;;;;;;;;;

; modes
(defalias 'pym 'python-mode)
(defalias 'jsm 'js-mode)
(defalias 'rbm 'ruby-mode)
(defalias 'cssm 'scss-mode)
(defalias 'tm 'text-mode)
(defalias 'ssm 'shell-script-mode)
(defalias 'elm 'emacs-lisp-mode)
(defalias 'wsm 'whitespace-mode)
(defalias 'gwsm 'global-whitespace-mode)

; commands
(defalias 'cr 'comment-region)
(defalias 'ucr 'uncomment-region)

;; I really need to get rid of this module. 
(load-file "~/.emacs.d/plugins/nxhtml/autostart.el")

;; thats all!
;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(js2-basic-offset 4 t)
 '(scheme-program-name "mzscheme")
 '(send-mail-function (quote mailclient-send-it))
 '(standard-indent 4)
 '(warning-minimum-level :error))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
