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
   '(html
     ;;(conda :variables conda-anaconda-home "/home/alex/.anaconda3")
     yaml
     rust
     lsp  ;; only necessary if rust is enabled
     sql
     javascript
     markdown
     ;; nlinum offers the features of linum with better large buffer support.
     csv
     (python :variables python-test-runner 'pytest python-backend 'lsp) ;;lsp
     (ess :variables ess-r-backend 'lsp)
     ;; pdf ;; TODO this stopped working at latest release.
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
     ;; to allow magit to see files inside of directories, run the following command:
     ;; git config --global status.showUntrackedFiles all
     ;; to store git credentials
     ;; git config --global credential.helper store
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
     ;; lsp ;; for some reason this is not needed here - it may be implicitly called by python when telling it to use lsp.
     spell-checking
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
                                      ;; TODO get better lentic views
                                      lentic
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    ;;smartparens ;; dont use smartparens
                                    company-tern ;; see https://github.com/syl20bnr/spacemacs/issues/13530
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
   dotspacemacs-themes '(spacemacs-light
                         cyberpunk
                         leuven
                         inkpot
                         zenburn

                         soft-charcoal
                         spacemacs-dark
                         solarized-dark
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
   dotspacemacs-auto-resume-layouts nil
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
   dotspacemacs-fullscreen-at-startup nil
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
   dotspacemacs-line-numbers t
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

  ;; evil numbers keybindings (c-a and c-x to increment and decrement numbers)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
  (define-key evil-visual-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

  ;; set urxvt as external terminal
  (setq terminal-here-terminal-command '("urxvt" "-fade" "50"))
  ;; enable org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages '((python . t)
                               (dot . t)
                               (R . t)
                               (shell . t)))

  ;; org latex and image preview keybinding
  (spacemacs/set-leader-keys-for-minor-mode 'org-mode (kbd "v") 'org-latex-preview)
  (spacemacs/set-leader-keys-for-minor-mode 'org-mode (kbd "V") 'org-toggle-inline-images)
  ;; org image size
  (setq org-image-actual-width 30)

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
   '((R . t) ;; TODO R sessions don't work
     (latex . t)))

  ;; Tangling and org mode code
  ;; image size in org mode
  (setq org-image-actual-width 500)
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
  ;; (spacemacs/toggle-highlight-current-line-globally-off)

  ;; latex style for exporting org files to pdf
;;  (unless (boundp 'org-latex-classes)
;;    (setq org-latex-classes nil))
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
  (add-to-list 'org-latex-classes
               '("report"
                 "\\documentclass[11pt,a4paper]{article}
\\usepackage[left=1cm, right=1cm, top=1cm]{geometry}  % define margins
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
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ))
  (add-to-list 'org-latex-classes '("letter" "\\documentclass{letter}"
                                    ("\\section{%s}" . "\\section*{%s}")
                                    ("\\subsection{%s}" . "\\subsection*{%s}")
                                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                    ))
  (setq org-list-allow-alphabetical t)

   ;; Define global settings for plaintext like buffers
   (define-global-minor-mode my-centered-cursor-mode centered-cursor-mode
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
          )))

   ;;(define-global-minor-mode my-line-number-mode centered-cursor-mode
     ;;(lambda ()
       ;;(when (not (memq major-mode
                        ;;(list
                         ;;;; put modes to exclude here
                         ;;'slime-repl-mode
                         ;;'shell-mode
                         ;;'pdf-view-mode
                         ;;'spacemacs-buffer-mode
                         ;;'term-mode
                         ;;'magit-mode
                         ;;'magit-revision-mode
                         ;;'compilation-mode
                         ;;)))
         ;;(spacemacs/toggle-line-numbers-on)
         ;;)))

  ;; uncomment to enable global centered line mode. (It slows down less powerful systems)
  (my-centered-cursor-mode 1)


  ;; add all uni files to agenda (so the todo shows up)
   (setq org-agenda-files '("~/Documents/Uni/comp5310_principles_of_ds/TODOs.org"
                           "~/Documents/Uni/comp9120_dbms/TODOs.org"
                           "~/Documents/Uni/comp9007_algorithms/TODOs.org"
                           "~/Documents/Uni/stat5002_intro_to_statistics/TODOs.org"
                           ))

  ;; add _ as a word character in python mode
  (add-hook 'python-mode-hook
            (lambda () "" (modify-syntax-entry ?_ "w" python-mode-syntax-table)))

  ;; disable stop on error for pytest
  (setq pytest-cmd-flags "")

  ;; set python interperater
  ;; TODO this is a temporary solution. The proper solution is to set `exec-path' correctly.
  ;; see exec-path-from-shell?
  ;; (setq python-shell-interpreter "/home/alex/.anaconda3/envs/general/bin/python")
  ;; (setq org-babel-python-command "/home/alex/.anaconda3/envs/general/bin/python")

  ;; attempt to make org-mode python src blocks behave nicely with indentation
  (setq org-src-tab-acts-natively t)
  (setq org-edit-src-content-indentation 0)
  (setq org-export-allow-bind-keywords t)
  (global-lentic-mode)

  ;; stop python from opening new buffer on execution when its open in another frame
  ;; TODO none of these solutions work. Find one that does
  ;; maybe have a toggle for when pythonmode automatically opens a compilation buffer in a new window
  ;; see https://github.com/jorgenschaefer/elpy/issues/893
  ;; (add-to-list 'display-buffer-alist `(,"*Python*" (display-buffer-reuse-window)))
  ;; (setq-default display-buffer-reuse-frames t)
  (setenv "WORKON_HOME" "/home/alex/.anaconda3/envs")

  (setq org-download-screenshot-method "flameshot gui --raw > %s")

  ;; EXPERIMENTAL rotate pages in PDF-mode.
 (defun pdf-view--rotate (&optional counterclockwise-p page-p)
  "Rotate PDF 90 degrees.  Requires pdftk to work.\n
Clockwise rotation is the default; set COUNTERCLOCKWISE-P to
non-nil for the other direction.  Rotate the whole document by
default; set PAGE-P to non-nil to rotate only the current page.
\nWARNING: overwrites the original file, so be careful!"
  ;; error out when pdftk is not installed
  (if (null (executable-find "pdftk"))
      (error "Rotation requires pdftk")
    ;; only rotate in pdf-view-mode
    (when (eq major-mode 'pdf-view-mode)
      (let* ((rotate (if counterclockwise-p "left" "right"))
             (file   (format "\"%s\"" (pdf-view-buffer-file-name)))
             (page   (pdf-view-current-page))
             (pages  (cond ((not page-p)                        ; whole doc?
                            (format "1-end%s" rotate))
                           ((= page 1)                          ; first page?
                            (format "%d%s %d-end"
                                    page rotate (1+ page)))
                           ((= page (pdf-info-number-of-pages)) ; last page?
                            (format "1-%d %d%s"
                                    (1- page) page rotate))
                           (t                                   ; interior page?
                            (format "1-%d %d%s %d-end"
                                    (1- page) page rotate (1+ page))))))
        ;; empty string if it worked
        (if (string= "" (shell-command-to-string
                         (format (concat "pdftk %s cat %s "
                                         "output %s.NEW "
                                         "&& mv %s.NEW %s")
                                 file pages file file file)))
            (pdf-view-revert-buffer nil t)
          (error "Rotation error!"))))))

 (defun pdf-view-rotate-clockwise (&optional arg)
   "Rotate PDF page 90 degrees clockwise.  With prefix ARG, rotate
entire document."
   (interactive "P")
   (pdf-view--rotate nil (not arg)))

 (defun pdf-view-rotate-counterclockwise (&optional arg)
   "Rotate PDF page 90 degrees counterclockwise.  With prefix ARG,
rotate entire document."
   (interactive "P")
   (pdf-view--rotate :counterclockwise (not arg)))

 (spacemacs/set-leader-keys-for-minor-mode 'org-mode (kbd "R")  'pdf-view-rotate-clockwise)
  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (toml-mode racer flycheck-rust cargo rust-mode zenburn-theme yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tern terminal-here tagedit symon symbol-overlay string-inflection sql-indent sphinx-doc spaceline-all-the-icons solarized-theme soft-charcoal-theme smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters pytest pyenv-mode py-isort pug-mode prettier-js posframe popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file ob-async nodejs-repl neotree nameless multi-term move-text mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-python-ms lorem-ipsum livid-mode live-py-mode link-hint lentic json-navigator json-mode js2-refactor js-doc inkpot-theme indent-guide importmagic impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flyspell-correct-helm flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav ein editorconfig dumb-jump dotenv-mode diminish devdocs define-word dap-mode cython-mode cyberpunk-theme csv-mode company-web company-reftex company-auctex company-anaconda column-enforce-mode clean-aindent-mode centered-cursor-mode blacken auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((lentic-init . lentic-org-python-init)
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp))))
 '(writeroom-fullscreen-effect (quote fullboth)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36")))))
)
