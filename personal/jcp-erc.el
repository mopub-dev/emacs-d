(require 'erc)
(require 'erc-join)
(require 'erc-match)
(require 'erc-track)
(require 'erc-fill)
(require 'erc-ring)

;; timestamps on
(erc-timestamp-mode t)

;; Notify me if someone calls me
(erc-match-mode t)

;; settings for the default server (freenode)
(setq erc-server "irc.freenode.net"
      erc-port 6667
      erc-nick "streblo"
      erc-user-full-name "Wub Womper"
      erc-email-userid "streblo"
      erc-prompt-for-password t
      erc-fill-prefix "      "
      erc-auto-query t
      erc-keywords '("streblo" "geckimo", "409advisor", "409", "409A")
      erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "%H:%M "
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-log-channels t
      erc-log-channels-directory "~/.irclogs"
      erc-log-insert-log-on-open t)

;; autojoin channels on connect
(erc-autojoin-mode t)

;; which channels to autojoin
(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#emacs" "#python" "#django" "#postgresql" "#modest")))

;; check channels for activity 
(erc-track-mode t)

;; ignore this type of activity
(setq erc-track-exclude-types
      '("JOIN" "NICK" "PART" "QUIT" "MODE"
        "324" "329" "332" "333" "353" "477"))

;; don't show any of this anywhere
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))


(defun erc-switcher ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  
  ;; ERC already active?
  (if (get-buffer "irc.freenode.net:6667") 
      ;; yes: switch to last active
      (erc-track-switch-buffer 1)
      ;; no: maybe start ERC
      (when (y-or-n-p "Start ERC? ") 
        (erc :server "irc.freenode.net"
             :port 6667
             :nick "streblo"
             :full-name "Wub Womper"))))

;; switch to ERC with Ctrl+c e
(global-set-key (kbd "C-c e") 'erc-switcher) ;; ERC

