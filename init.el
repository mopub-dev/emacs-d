;;;;;;;;;;;;;;;;;;;;;;;;;
;; john.pena@gmail.com ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(message "Loading Emacs settings")

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set up all of the load directories.

(defvar emacs-dir (file-name-directory load-file-name)
  "Usually set to .emacs.d/ or emacs/, it's the directory we're in right now.")

(defvar plugins-dir (concat emacs-dir "plugins/")
  "All of the plugins that I didn't write go in here. This should only
  have non-ELPA modules.")

(defvar personal-dir (concat emacs-dir "personal/")
  "My personal configs.")

;; add all this to the `load-path'
(add-to-list 'load-path emacs-dir)
(add-to-list 'load-path plugins-dir)
(add-to-list 'load-path personal-dir)

;; Load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

;; Load plugins ;;
(add-to-list 'load-path (concat plugins-dir "auto-complete/"))
(add-to-list 'load-path (concat plugins-dir "color-theme/"))
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
(require 'jcp-erc)

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
(require 'linum)
(require 'markdown-mode)
(require 'midnight)
(require 'package)
(require 'rainbow-mode)
(require 'recentf)
(require 'saveplace)
(require 'smex)
(require 'speedbar)
(require 'uniquify)
(require 'workgroups)
(require 'yaml-mode)
(require 'yasnippet)


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
(add-to-list 'auto-mode-alist '("\\.scss\\'" . all-scss-modes))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . django-html-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("bashrc\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

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
 '(mumamo-background-chunk-major ((t (:background "#32342C"))))
 '(mumamo-background-chunk-submode1 ((t (:background "dim gray"))))
 '(mumamo-background-chunk-submode2 ((t (:background "dim gray")))))
