;; functions.el
;; John Pena (john.pena@gmail.com)

;; User defined general functions

(defun view-url ()
  "Open a new buffer containing the contents of the URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
	 (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    (cond ((search-forward "<?xml" nil t) (xml-mode))
	  ((search-forward "<html" nil t) (html-mode)))))

(defun turn-off-toolbar ()
  (tool-bar-mode -1))

(defun cleanup-buffer ()
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun lorem ()
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum.")) 

(defun lorizzle ()
  (interactive)
  (insert "Lorizzle ipsum dolizzle get down get down get down get"
	  "down, consectetuer adipiscing elit. Ma nizzle dope velit, black volutpat,"
          "suscipit pimpin', check out this vizzle, yeah."))

;;Lorizzle ipsum dolizzle get down get down get down getdown, consectetuer adipiscing elit. Ma nizzle dope velit, black volutpat,suscipit pimpin', re-up this vizzle, yeah.

(defun isoD ()
  (interactive)
  (insert (format-time-string "%c" (current-time))))

;; like C-k but it doesnt kill the line
(defun duplicate-line ()
  (interactive)
  (kill-line)
  (yank)
  (move-beginning-of-line 1))
(global-set-key "\C-d" 'duplicate-line)


(defun tag-word-or-region (tag)
    "Surround current word or region with a given tag."
    (interactive "sEnter tag (without <>): ")
    (let (pos1 pos2 bds start-tag end-tag)
        (setq start-tag (concat "<" tag ">"))
        (setq end-tag (concat "</" tag ">"))
        (if (and transient-mark-mode mark-active)
            (progn
                (goto-char (region-end))
                (insert end-tag)
                (goto-char (region-beginning))
                (insert start-tag))
            (progn
                (setq bds (bounds-of-thing-at-point 'symbol))
                (goto-char (cdr bds))
                (insert end-tag)
                 (goto-char (car bds))
                 (insert start-tag)))))
(global-set-key "\C-xt" 'tag-word-or-region)

;;(defun tag-line (tag)
;;  "Surrounds the given line with a tag"
;;  (interactive)
;;  ())

(provide 'functions)