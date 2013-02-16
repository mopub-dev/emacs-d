;;;;;;;;;;;;;;;;;;;;;;;;;
;; john.pena@gmail.com ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Loading Emacs settings")

;; No splash screen
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Set up all of the load directories.

(defvar emacs-dir (file-name-directory load-file-name)
  "Usually set to .emacs.d/ or emacs/, it's the directory we're in right now.")

(defvar plugins-dir (concat emacs-dir "plugins/")
  "All of the plugins that I didn't write go in here. This should only
  have non-el-get modules.")

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


;; Load other plugins

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
