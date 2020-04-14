;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     sql
     javascript
     markdown
     ;; nlinum offers the features of linum with better large buffer support.
     csv
     (python :variables python-test-runner 'pytest)
     pdf
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     shell
     auto-completion
     neotree
     ;; treemacs
     ;; better-defaults ;; adds extra emacs style keybindings
     emacs-lisp
     git
     ;; markdown
     multiple-cursors
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     latex
     ;; version-control

     ;; advice from https://www.reddit.com/r/spacemacs/comments/d7wdij/python_with_spacemacs_rather_than_pycharm/f16k4lp/
     ;; python language server from here: https://github.com/palantir/python-language-server
     lsp
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      org-plus-contrib ;; added for cheatsheet submodule
                                      sphinx-doc ;; alternatives:
                                      ;; http://tiborsimko.org/emacs-epydoc-snippets.html
                                      ;; https://emacs.stackexchange.com/questions/19422/library-for-automatically-inserting-python-docstring-in-google-style
                                      ein
                                      ob-async
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    smartparens ;; dont use smartparens
                                    );;neotree)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 3)
                                (projects . 12))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         cyberpunk
                         leuven
                         inkpot
                         zenburn
                         soft-charcoal
                         spacemacs-dark
                         spacemacs-light
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme 'spacemacs

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 0.8
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 1.5
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;; :disabled-for-modes dired-mode
   ;;                      doc-view-mode
   ;;                      markdown-mode
   ;;                      org-mode
   ;;                      pdf-view-mode
   ;;                      text-mode
   ;;  :size-limit-kb 1000)
   ;; when used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; enable python in orgmode command blocks
  (org-babel-do-load-languages
   'org-babel-load-languages '( (python . t) (dot . t)))



  ;; org latex preview keybinding
  (spacemacs/set-leader-keys-for-minor-mode 'org-mode (kbd "v") 'org-latex-preview)
  (spacemacs/set-leader-keys-for-minor-mode 'org-mode (kbd "V") 'org-toggle-inline-images)

  ;; enable transparency
  (spacemacs/toggle-transparency)

  ;; ein keybindings
  ;;(evil-define-minor-mode-key 'normal 'ein:notebook (kbd "<c-return>") 'ein:ein:worksheet-execute-cell)
  ;;(evil-define-key ein:notebook-mode-map (kbd "S-<ret>") 'ein:ein:worksheet-execute-cell)
  ;; "gj" 'ein:worksheet-goto-next-input
  ;; "gk" 'ein:worksheet-goto-prev-input
  ;; "C-RET" 'ein:worksheet-execute-cell
  ;; "S-RET" 'ein:worksheet-execute-cell-and-goto-next
  (progn
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "," 'ein:worksheet-execute-cell)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "c c" 'ein:worksheet-execute-all-cell)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "h" 'ein:notebook-worksheet-open-prev-or-last)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "j" 'ein:worksheet-goto-next-input)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "k" 'ein:worksheet-goto-prev-input)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "l" 'ein:notebook-worksheet-open-next-or-first)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "H" 'ein:notebook-worksheet-move-prev)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "J" 'ein:worksheet-move-cell-down)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "K" 'ein:worksheet-move-cell-up)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "L" 'ein:notebook-worksheet-move-next)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "t" 'ein:worksheet-toggle-output)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "d" 'ein:worksheet-kill-cell)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "R" 'ein:worksheet-rename-sheet)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "y" 'ein:worksheet-copy-cell)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "p" 'ein:worksheet-yank-cell)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "i" 'ein:worksheet-insert-cell-below)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "I" 'ein:worksheet-insert-cell-above)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "u" 'ein:worksheet-change-cell-type)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "RET" 'ein:worksheet-execute-cell-and-goto-next)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-l" 'ein:worksheet-clear-output)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-S-l" 'ein:worksheet-clear-all-output)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-o" 'ein:console-open)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-k" 'ein:worksheet-merge-cell)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-j" 'spacemacs/ein:worksheet-merge-cell-next)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "s" 'ein:worksheet-split-cell-at-point)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-s" 'ein:notebook-save-notebook-command)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "C-r" 'ein:notebook-rename-command)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "1" 'ein:notebook-worksheet-open-1th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "2" 'ein:notebook-worksheet-open-2th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "3" 'ein:notebook-worksheet-open-3th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "4" 'ein:notebook-worksheet-open-4th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "5" 'ein:notebook-worksheet-open-5th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "6" 'ein:notebook-worksheet-open-6th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "7" 'ein:notebook-worksheet-open-7th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "8" 'ein:notebook-worksheet-open-8th)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "9" 'ein:notebook-worksheet-open-last)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "+" 'ein:notebook-worksheet-insert-next)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "-" 'ein:notebook-worksheet-delete)
    (spacemacs/set-leader-keys-for-minor-mode 'ein:notebook "x" 'ein:notebook-close)
  )

  ;; move images into a nogit folder with org-download
  (setq-default org-download-image-dir "./.images")

  ;; get org mode to export text blocks nicely
  (require 'org)
  (require 'ox-latex)
  (add-to-list 'org-latex-packages-alist '("" "minted" "tabularx"))
  (setq org-latex-listings 'minted)

  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  (setq org-src-fontify-natively t)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (latex . t)))

  ;; Tangling and org mode code
  ;; org mode insert template
  (spacemacs/set-leader-keys-for-minor-mode 'evil-org-mode "i t"
    'org-insert-structure-template)
  ;; org tangle code
  (spacemacs/set-leader-keys-for-minor-mode 'evil-org-mode "o t"
    'org-babel-tangle)
  ;; org detangle in python-mode
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "o t"
    'org-babel-detangle)
  ;; jump to org file at location in tangled file
  (spacemacs/set-leader-keys-for-major-mode 'python-mode "o j"
    'org-babel-tangle-jump-to-org)

  ;; disable current line highlighting (centered line shows where you are much
  ;; better)
  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; latex style for exporting org files to pdf
  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))
  (add-to-list 'org-latex-classes
               '("assignment"
                 "\\documentclass[11pt,a4paper]{article}
\\usepackage[left=2cm, right=2cm, top=2cm]{geometry}  % define margins
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
%\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\usepackage{mathpazo}
\\usepackage{color}
\\usepackage{enumerate}
\\usepackage{tcolorbox} % for box around codeblocks
\\usepackage{etoolbox} % for box around codeblocks
\\usepackage[fancyvrb=true]{listings}
\\definecolor{bg}{rgb}{0.95,0.95,0.95}
\\tolerance=1000
      [NO-DEFAULT-PACKAGES]
      [PACKAGES]
      [EXTRA]
\\linespread{1}
\\hypersetup{pdfborder=0 0 0}

% add box around codeblocks
\\BeforeBeginEnvironment{minted}{\\begin{tcolorbox}}
\\AfterEndEnvironment{minted}{\\end{tcolorbox}}
% set the minted default font size
\\setminted{fontsize=\\footnotesize}
"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")))

   ;; Define global settings for plaintext like buffers
   (define-global-minor-mode my-global-plaintext-mode centered-cursor-mode
     (lambda ()
       (when (not (memq major-mode
                        (list
                         ;; put modes to exclude here
                         'slime-repl-mode
                         'shell-mode
                         'pdf-view-mode
                         'spacemacs-buffer-mode
                         'term-mode
                         'magit-mode
                         'magit-revision-mode
                         )))
          (centered-cursor-mode)
          ;;(spacemacs/toggle-line-numbers-on)
          ;;(nlinum-relative-mode)
          )))

  (my-global-plaintext-mode 1)

  ;; make it faster
  (setq flycheck-highlighting-mode 'lines)
  (org-reload)

  ;; disable automatic explenation of errors
  (defadvice flycheck-display-error-at-point-soon
      (after flycheck-display-error-at-point-soon-advice activate compile)
    (flycheck-cancel-error-display-error-at-point-timer))

  ;; make windows split vertically instead of horisontally
  (setq split-height-threshold nil)
  (setq split-width-threshold 80)

  ;; add all uni files to agenda (so the todo shows up)
  (setq org-agenda-files (directory-files-recursively "~/Documents/Uni/" "\.org$"))

  ;; add _ as a word character
  (add-hook 'python-mode-hook (lambda () "" (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

  ;; stop python from opening new buffer on execution when its open in another frame
  ;; see https://github.com/jorgenschaefer/elpy/issues/893
  ;; (add-to-list 'display-buffer-alist `(,"*Python*" (display-buffer-reuse-window)))
  (setq-default display-buffer-reuse-frames t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(ein:output-area-inlined-images t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838" t)
 '(org-agenda-files
   (quote
    ("/home/alex/Documents/Uni/Comp5046 NLP/Week 02/NLP L2.org" "/home/alex/Documents/Uni/Comp5046 NLP/Week 03/NLP L3.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 01/DS L1.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 02/DS L2.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 03/DS L3.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 04/DS L4.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 04/original.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 04/submission.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 05/05_Summarising_Data_with_SQL.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 05/DS t5.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 05/test.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 06/06_hypothesis_testing_and_evaluation.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/Week 06/DS t6.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/nogit_Project/assignment ideas.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/nogit_Project/initial_analysis.org" "/home/alex/Documents/Uni/Comp5310 Principles of DS/nogit_Project/normalize.org" "/home/alex/Documents/Uni/Comp5318 Machine Learning/Week 03/ML L3.org" "/home/alex/Documents/Uni/Comp9007 Algorithms/Assignment 1/assignment 1.org" "/home/alex/Documents/Uni/Comp9007 Algorithms/Quiz 1/quiz 1.org" "/home/alex/Documents/Uni/Comp9007 Algorithms/Week 01/Algorithms L1.org" "/home/alex/Documents/Uni/Comp9007 Algorithms/Week 03/Algorithms L3.org" "/home/alex/Documents/Uni/Comp9007 Algorithms/Week 04/Algorithms L4.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Assignment 1/DBMS A1.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Reference/ER Diagrams.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 01/DBMS L1.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 02/DBMS L2.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 03/DBMS L3.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 04/DBMS L4.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 04/DBMS T4.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 05/DBMS L5.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 05/DBMS T5.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 06/DBMS t6.org" "/home/alex/Documents/Uni/Comp9120 DBMS/Week 09/DBMS L9.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Quiz 1/Stats Q1.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Week 01/Stats L1.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Week 02/Stats L2.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Week 03/Stats L3.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Week 04/Stats L4.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Week 05/Stats l5.org" "/home/alex/Documents/Uni/Stat5002 Intro to Stats/Week 06/Stats l6.org" "/home/alex/Documents/Uni/clean.org" "/home/alex/Documents/Uni/general organization.org" "/home/alex/Documents/Uni/test.org")))
 '(package-selected-packages
   (quote
    (sql-indent web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode sphinx-doc org-tanglesync nlinum-relative nlinum ob-async lentic m-buffer smeargle orgit magit-gitflow magit-popup helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit git-commit with-editor transient company-auctex auctex-latexmk auctex mmm-mode markdown-toc markdown-mode gh-md csv-mode pdf-tools tablist ein eink-theme polymode deferred anaphora websocket xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help helm-company helm-c-yasnippet fuzzy company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete yapfify pyvenv pytest pyenv-mode py-isort pip-requirements org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download live-py-mode hy-mode dash-functional htmlize helm-pydoc gnuplot flycheck-pos-tip pos-tip flycheck cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#d3d3d3" :background "#000000" :family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 98 :width normal)))))
