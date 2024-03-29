((ace-jump-mode status "installed" recipe
                (:name ace-jump-mode :website "https://github.com/winterTTr/ace-jump-mode/wiki" :description "A quick cursor location minor mode for emacs" :type github :pkgname "winterTTr/ace-jump-mode" :features ace-jump-mode))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (browse-kill-ring status "installed" recipe
                   (:name browse-kill-ring :description "Interactively insert items from kill-ring" :type github :pkgname "browse-kill-ring/browse-kill-ring"))
 (coffee-mode status "installed" recipe
              (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
                     (progn
                       (add-to-list 'auto-mode-alist
                                    '("\\.coffee$" . coffee-mode))
                       (add-to-list 'auto-mode-alist
                                    '("Cakefile" . coffee-mode))
                       (setq coffee-js-mode 'javascript-mode))))
 (color-theme status "installed" recipe
              (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
                     ("xzf")
                     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
                     (progn
                       (color-theme-initialize)
                       (setq color-theme-is-global t))))
 (color-theme-almost-monokai status "installed" recipe
                             (:name color-theme-almost-monokai :description "A beautiful, fruity, calm, yet dark color theme for Emacs." :type github :pkgname "lut4rp/almost-monokai" :depends color-theme :prepare
                                    (autoload 'color-theme-almost-monokai "color-theme-almost-monokai" "color-theme: almost-monokai" t)))
 (color-theme-desert status "installed" recipe
                     (:name color-theme-desert :description "A port of VIM's desert color theme to Emacs." :type github :pkgname "superbobry/color-theme-desert" :depends color-theme :prepare
                            (autoload 'color-theme-desert "color-theme-desert" "color-theme: desert" t)))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp" :website "https://github.com/kiwanami/emacs-deferred" :type github :pkgname "kiwanami/emacs-deferred" :features "deferred"))
 (dired-details status "installed" recipe
                (:name dired-details :description "Make file details hide-able in dired" :type emacswiki :features dired-details))
 (dpaste status "installed" recipe
         (:name dpaste :auto-generated t :type emacswiki :description "Emacs integration for dpaste.com" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/dpaste.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme" :features expand-region))
 (ffap- status "installed" recipe
        (:name ffap- :auto-generated t :type emacswiki :description "Extensions to library `ffap.el'" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/ffap-.el"))
 (flymake status "installed" recipe
          (:name flymake :description "Continuous syntax checking for Emacs." :type github :pkgname "illusori/emacs-flymake"))
 (flymake-cursor status "installed" recipe
                 (:name flymake-cursor :type github :pkgname "illusori/emacs-flymake-cursor" :description "displays flymake error msg in minibuffer after delay (illusori/github)" :website "http://github.com/illusori/emacs-flymake-cursor"))
 (flymake-sass status "installed" recipe
               (:name flymake-sass :type github :pkgname "purcell/flymake-sass" :description "Flymake handler for sass files" :website "http://github.com/purcell/flymake-sass" :post-init
                      (add-hook 'sass-mode-hook 'flymake-sass-load)))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (haml-mode status "installed" recipe
            (:name haml-mode :description "Major mode for editing Haml files" :type github :pkgname "nex3/haml-mode"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :features helm-config))
 (hexrgb status "installed" recipe
         (:name hexrgb :auto-generated t :type emacswiki :description "Functions to manipulate colors, including RGB hex strings." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/hexrgb.el"))
 (highlight-current-line status "installed" recipe
                         (:name highlight-current-line :auto-generated t :type emacswiki :description "highlight line where the cursor is." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/highlight-current-line.el"))
 (html5 status "installed" recipe
        (:name html5 :website "http://github.com/hober/html5-el" :description "Umbrella project for projects adding HTML5 support to Emacs.\n  This recipe is a work in progress." :type git :url "http://github.com/hober/html5-el" :post-init
               (eval-after-load "rng-loc"
                 '(add-to-list 'rng-schema-locating-files
                               (concat el-get-dir "html5/schemas.xml")))
               :features whattf-dt :build
               ("make relaxng")))
 (htmlize status "installed" recipe
          (:name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type http :url "http://fly.srk.fer.hr/~hniksic/emacs/htmlize.el.cgi" :localname "htmlize.el"))
 (ido-ubiquitous status "installed" recipe
                 (:name ido-ubiquitous :description "Use ido (nearly) everywhere" :type elpa))
 (inf-ruby status "installed" recipe
           (:name inf-ruby :type http :description "Inferior Ruby Mode - ruby process in a buffer." :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/inf-ruby.el"))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :build
              (("make" "requirements"))
              :depends
              (epc auto-complete)))
 (js2-mode status "installed" recipe
           (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (js3-mode status "installed" recipe
           (:name js3-mode :website "https://github.com/thomblake/js3-mode#readme" :description "A chimeric fork of js2-mode and js-mode" :type github :pkgname "thomblake/js3-mode" :prepare
                  (autoload 'js3-mode "js3" nil t)))
 (less status "installed" recipe
       (:name less :auto-generated t :type emacswiki :description "less style view mode" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/less.el"))
 (linum+ status "installed" recipe
         (:name linum+ :auto-generated t :type emacswiki :description "Extension of linum" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/linum+.el"))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :build
               `(("make" ,(format "EMACS=%s" el-get-emacs)
                  "all"))
               :build/berkeley-unix
               (("touch" "`find . -name Makefile`")
                ("gmake"))))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :before
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (midje-mode status "installed" recipe
             (:name midje-mode :type github :pkgname "dnaumov/midje-mode" :website "https://github.com/dnaumov/midje-mode" :description "Midje is a testing framework for the Clojure programming language;\nmidje-mode integrates it with Emacs, providing features like navigation and test reports."))
 (nginx-mode status "installed" recipe
             (:name nginx-mode :website "https://github.com/ajc/nginx-mode" :description "major mode for editing nginx config files" :type github :pkgname "ajc/nginx-mode"))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin 24 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (setq package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))
                         package-directory-list
                         (list
                          (file-name-as-directory package-user-dir)
                          "/usr/share/emacs/site-lisp/elpa/"))
                   (make-directory package-user-dir t)
                   (unless
                       (boundp 'package-subdirectory-regexp)
                     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
                   (setq package-archives
                         '(("ELPA" . "http://tromey.com/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (pbcopy status "installed" recipe
         (:name pbcopy :description "An interface to OSX's pbcopy utility" :type github :pkgname "jkp/pbcopy.el" :features "pbcopy"))
 (pomodoro status "installed" recipe
           (:name pomodoro :auto-generated t :type emacswiki :description "Pomodoro Technique for emacs" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/pomodoro.el"))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (popwin status "installed" recipe
         (:name popwin :description "Popup Window Manager." :website "https://github.com/m2ym/popwin-el" :type github :pkgname "m2ym/popwin-el"))
 (rainbow-delimiters status "installed" recipe
                     (:name rainbow-delimiters :website "https://github.com/jlr/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "jlr/rainbow-delimiters"))
 (rainbow-mode status "installed" recipe
               (:name rainbow-mode :description "Colorize color names in buffers" :type elpa))
 (sass-mode status "installed" recipe
            (:name sass-mode :description "Major mode for editing Sass files" :type github :pkgname "nex3/sass-mode" :depends haml-mode :post-init
                   (add-to-list 'auto-mode-alist
                                '("\\.scss$" . sass-mode))))
 (scss-mode status "installed" recipe
            (:name scss-mode :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features scss-mode))
 (slime status "installed" recipe
        (:name slime :description "Superior Lisp Interaction Mode for Emacs" :type github :autoloads "slime-autoloads" :info "doc" :pkgname "nablaone/slime" :load-path
               ("." "contrib")
               :compile
               (".")
               :build
               '(("make" "-C" "doc" "slime.info"))
               :post-init
               (slime-setup)))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
              (smex-initialize)))
 (speedbar-extension status "installed" recipe
                     (:name speedbar-extension :auto-generated t :type emacswiki :description "Some extensions for speedbar" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/speedbar-extension.el"))
 (web-mode status "installed" recipe
           (:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (workgroups status "installed" recipe
             (:name workgroups :description "Workgroups for windows (for Emacs)" :type github :pkgname "tlh/workgroups.el" :features "workgroups"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule nil))
 (yasnippet-config status "installed" recipe
                   (:name yasnippet-config :auto-generated t :type emacswiki :description "Configuration of yasnippet.el" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/yasnippet-config.el"))
 (zenburn-theme status "installed" recipe
                (:name zenburn-theme :description "Zenburn theme for Emacs" :type http :url "https://raw.github.com/djcb/elisp/master/themes/zenburn-theme.el" :post-init
                       (add-to-list 'custom-theme-load-path default-directory))))
