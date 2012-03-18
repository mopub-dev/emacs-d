;; flymake config

(load-library "flymake-cursor")

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(defun python-debug ()
  (interactive)
  (insert "from IPython.Shell import IPShellEmbed; IPShellEmbed()()"))

(defun my-python-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))

(setq compilation-scroll-output t)

(defun my-python-mode-hook ()
  (require 'python)
  (local-set-key "\C-c\C-c" 'my-python-compile))

(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-hook 'python-mode-hook 'show-fly-err-at-point)

(provide 'jcp-python)
