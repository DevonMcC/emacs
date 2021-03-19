; Devon's GNU Emacs initialization file - now Win-oriented
;though traces of its Unix and ksh heritages remain.

(setq base-disk (getenv "BASEDSK"))
(if (eq base-disk nil) (setq base-disk "C:"))
(if (eq aux-disk nil) (setq aux-disk "D:"))
(setq EmacsBase (concat base-disk "/Pgm/Emacs/x86_64/"))
(setq pgm-dir-home EmacsBase)
(setq eshell-prompt-function
    (lambda nil
        (concat (concat (format-time-string "%Y-%m-%d %a %H:%M:%S.%3N %z" (current-time)))
        " | " (eshell/pwd) "
  ")))
;*EG 2015-11-18 11:20:00.902 -0500 | c:/Clarifi
(defcustom eshell-prompt-regexp "20[0-9][0-9]-[0-9][0-9]-[0-9][0-9] [A-Z][a-z][a-z] [0-2][0-9]:[0-5][0-9]:[0-5][0-9]\.[0-9][0-9][0-9] [-+][0-1][0-9][0-9][0-9] | *"
  "A regexp which fully matches your eshell prompt."
  :type 'regexp
  :group 'eshell-prompt)

(setq load-path (cons (concat EmacsBase "addons") load-path))
(setq load-path (cons (concat EmacsBase "addons/ess-18.10.2/lisp") load-path))
(add-to-list 'load-path (concat pgm-dir-home "Emacs\\site-lisp\\"))

(load "define-error.el")
(load "file-name-base.el")
(load "image-dired.el")
(load "dired-external-apps.el")
;(load "graphviz-dot-mode.el")    ; ex-20200517

(require 'tramp)
(require 'ido) ;For emacs 22 and above...

(fset 'cvt-spreadsheet-mat-to-J
   [escape ?r ?\C-q tab return ?  return ?\C-x ?[ escape ?r ?\C-q ?\C-j return ?, return ?\C-b ?\C-d ?\C-r ?, ?\C-b ?\C-f ?\C-f ?: ?\C-x ?[])

; Show column number where cursor is.
(column-number-mode 1)

;  High-contrast, light foreground screen colors:
;(set-foreground-color "yellow")
;(set-foreground-color "navajowhite")
;(set-foreground-color "orange")
;(set-foreground-color "gold")
;(set-foreground-color "yellowgreen")
;(set-foreground-color "lightgreen")
;(set-foreground-color "chartreuse1")
;(set-foreground-color "lightcyan")
;  High-contrast, dark background screen colors:
;(set-background-color "DarkSlateBlue")
;(set-background-color "darkslategray")
;(set-background-color "Maroon")
;(set-background-color "blue4")
;(set-background-color "darkorchid4")
;(set-background-color "firebrick4")
;(set-background-color "navy")
;(set-background-color "gray17")

(set-background-color "black")
(set-foreground-color "gold")

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

; word-wrap64: set lines to wrap to keep text within 64 columns and turn
; on the mode to accomplish the wrap; assign to f2 key.
(fset 'word-wrap64
   [?\C-[ ?6 ?4 ?\C-[ ?x ?s ?e ?t ?- ?f ?i ?l ?l ?- ?c ?o ?l ?u ?m ?n return ?\C-[ ?x ?a ?u ?t ?o ?- ?f ?i ?l ?l ?- ?m ?o ?d ?e return])
; Usual J expression to convert tab-delimited fields in LF-delimited lines to mat.
(global-set-key [f2] "<;._1&>TAB,&.><;._2 ] LF (] , [ #~ [ ~: [: {: ]) CR-.~")

;  The following statements make APL (high-bit) chars displayable:
(standard-display-8bit 14 255)
(standard-display-8bit 0 9)
(standard-display-8bit 11 12)
;(set-default-font "-outline-Dyalog-*-*-*-*-14-96-120-120-c-80-iso10646-1")
;(set-default-font "-outline-Lucida Console-normal-r-normal-normal-14-96-96-120-c-*-iso8859-1")
;(apl-set-font "-gnu-unifont-*-r-*--*-*-*-*-*-*-ISO10646-1")
;(apl-set-font '("gnu-unifont" . "ISO10646-1"))

;(set-default-font "Monospace-12")
;(set-default-font "-outline-Courier New-normal-r-normal-normal-16-96-96-120-c-*-iso8859-1")
;"High Tower Text-10" "Felix Titling-10" "Haettenschweiler-10"
;"Baskerville Old Face-10" "Empire State Deco-10"
;"Distorted Faith-9" "Corbel-10" "Edwardian Script ITC-9"
;(set-default-font "-outline-Consolas-normal-r-normal-normal-15-96-96-120-c-*-iso8859-1")

;**(set-default-font "-outline-DejaVuSerif-normal-r-normal-normal-15-96-96-120-c-*-iso8859-1")

(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-10"))

;(set-default-font "Consolas-12") ; ex 20210307
;(set-default-font "-outline-APL Help-normal-normal-normal-mono-*-*-*-*-c-*-iso8859-1") ; ex 20210307
;(set-default-font "-outline-APL385 Unicode-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1") ; ex 20210307
;(set-default-font "-outline-APL385 Unicode-normal-normal-normal-mono-*-*-*-*-c-*-iso8859-1") ; ex 20210307
;(set-default-font "-outline-APL385 Unicode-normal-normal-normal-mono-15-*-*-*-c-*-iso8859-1") ; ex 20210307
;(set-default-font "Hack-12") ; ex 20210307
(set-cursor-color "green")
(set-face-attribute 'default nil :font "Consolas-10")
(set-face-attribute 'default nil :font "Hack-11")
(set-frame-font "Consolas-10" nil t)
(set-frame-font "Hack-11" nil t)
(set-face-attribute 'default nil :height 160)
(set-frame-size (selected-frame) 96 28)
(set-frame-position (selected-frame) 50 10)

;  set up move 4-spaces command to assign tab to:
(fset 'move-4-spaces
   "    ")
; Convert [tab] -> 4 spaces...
(global-set-key [tab] 'move-4-spaces)

;  grab-from-39th-column: because #$@$#*#$ Microsoft decided to make spaces
;  valid characters in a name we can no longer rely on them as delimiters;
;  therefore, to grab a name from a DOS dir listing, assume it's at column 39.
(fset 'grab-from-39th-column
   "\C-a\C-[39\C-f\C-k\C-xu\C-x]\C-y")

;  Search a long distance for matching parentheses and braces:
(setq blink-matching-paren-distance 999999)

;                    *** My Macros ***
;  flip-word: reverse order of 1 word (space separated) on current line.
(fset 'flip-word
   "\C-x/a\C-e\C-r \C-k\C-xja\C-y")

; edit-fnc-at-eol: grab last name on current line and bring into editor.
(fset 'edit-file-at-eol
   "\C-e\C-r \C-f\C-k\C-xu\C-x]\C-x\C-f\C-y\C-m")

; ravel-block: put current block in buffer at current position
; one line w/block lines separated by 1 space.
(fset 'ravel-block
   [?\C-x ?r ?  ?a ?\C-c ?y ?\C-x ?j ?a escape ?r ?\C-q ?\C-j return ?  return ?\C-x ?j ?a])

;  Remove multiple spaces from point to end of file.
(fset 'despacemult
   [?\C-x ?r ?  ?a escape ?r ?  ?  ?  ?  ?  return ?  return ?\C-x ?j ?a escape ?r ?  ?  ?  ?  return ?  return ?\C-x ?j ?a escape ?r ?  ?  ?  return ?  return ?\C-x ?j ?a escape ?r ?  ?  return ?  return ?\C-x ?j ?a])

(fset 'run-comint-from-above
   "\C-rcomint\C-r\C-r\C-a\C-f\C-f\C-f\C-f\C-f\C-@\C-e\C-b\C-cx\C-a\C-n\C-n\C-n\C-n\C-f\C-f\C-f\C-f\C-f\C-@\C-e\C-b\C-cx\C-x]\C-e")

;detrail10: remove 10 (or fewer) trailing spaces from all lines in file: uses register a.
(fset 'detrail10
   [?\C-x ?/ ?a escape ?r ?  ?  ?  ?  ?\C-q ?\C-j return ?\C-q ?\C-j return ?\C-x ?j ?a escape ?r ?  ?  ?  ?\C-q ?\C-j return ?\C-q ?\C-j return ?\C-x ?j ?a escape ?r ?  ?  ?\C-q ?\C-j return ?\C-q ?\C-j return ?\C-x ?j ?a escape ?r ?  ?\C-q ?\C-j return ?\C-q ?\C-j return ?\C-x ?j ?a])

;* grabgoback2: grab name from dir line to cmd-line, then go back to same point; uses "grab-ls-name".
(fset 'grabgoback2
   [?\C-x ?/ ?a ?\M-x ?g ?r ?a ?b ?- ?l ?s ?- ?n ?a ?m ?e return ?  ?\C-x ?j ?a])
(fset 'grab-ls-name
   "\C-a\C-s:\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-f\C-@\C-e\367\C-x]\C-y")

;*** My Key Redefinitions ***
;  Make word/line grabbing more convenient.
(define-key global-map "\C-c\C-c" 'run-comint-from-above)  ; Defuse session breaker-doesn't work
(define-key global-map "\C-cb" 'grabgoback2)
; (define-key global-map "\C-cd" 'shell-resync-dirs)
(define-key global-map "\C-cd" 'default-directory-set-current)
(define-key global-map "\C-ce" 'edit-file-at-eol)
(define-key global-map "\C-cf" 'edit-after-cd-current)
(define-key global-map "\C-cg" 'grab-ls-name)
(define-key global-map "\C-cj" 'grab-line-from-other-buffer)

(defun start-BASH-session ()
    "Open BASH session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "\\utl\\cygwin64\\bin\\bash.exe"))
    (setq explicit-shell-file-name (concat base-disk "/Program Files (x86)/Git/bin/bash.exe"))
    (setq shell-file-name "BASH")
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-b" 'start-BASH-session)

; Cygwin terminal try gives spawn error...
(defun start-Cygwin-terminal-session ()
    "Open Cygwin terminal session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "\\utl\\cygwin64\\bin\\mintty.exe -i /Cygwin-Terminal.ico -"))
    (setq shell-file-name "Cygwin")
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-cC" 'start-Cygwin-terminal-session)

(defun start-DCS532-session ()
    "Run DCS for Clarifi v.5.3.2."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name "C:/Clarifi532/DCS/DataCacheServer.exe")
    (setq shell-file-name "DCS 5.3.2")
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-cD" 'start-DCS532-session)

(defun start-Ermine-session ()
    "Open Ermine session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq shell-file-name "Ermine")
    (setenv "SHELL" shell-file-name)
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
    (setq explicit-shell-file-name (concat base-disk "/utl/Ermine.bat"))
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-e" 'start-Ermine-session)

(defun start-GCC-session ()
    "Open GCC session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq shell-file-name "GCC")
    (setenv "GCC" shell-file-name)
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
    (setq explicit-shell-file-name (concat base-disk "/utl/cygwin64/bin/gcc.exe"))
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-G" 'start-GCC-session)

(defun start-Git-session ()
    "Open Git jconsole session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/GitShell.bat"))
    (setq shell-file-name "Git 1.9.2")
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-g" 'start-Git-session)

(defun start-Haskell-session ()
    "Open Haskell session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq shell-file-name "Haskell")
    (setenv "SHELL" shell-file-name)
    (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
    (setq explicit-shell-file-name (concat base-disk "/utl/Haskell.bat"))
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-h" 'start-Haskell-session)

(defun start-J-session ()
    "Open J jconsole session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/JPll.bat"))
    (setq explicit-shell-file-name (concat base-disk "/utl/J64-902.bat"))
    (setq shell-file-name "J9.02_64")
;    (setq explicit-shell-file-name (concat base-disk "/utl/J902Combo.bat"))
;    (setq shell-file-name "J9.02_64Combo")
;    (setq explicit-shell-file-name (concat base-disk "/Pgm/J902/jconsole.cmd"))
;    (setq shell-file-name "J9.02_64CmdBin")
    (shell)
    (insert "qts''\n")
    (insert "JVERSION\n")
    (insert "load 'Omaha.ijs'")
    (comint-send-input)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-j" 'start-J-session)

(defun start-J903-session ()
    "Open J 9.03 jconsole session."
    (interactive)
    (setq save-old-shell-file-name explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/J64-903.bat"))
    (setq shell-file-name "J9.03_64")
    (shell)
    (insert "qts''\n")
    (insert "JVERSION\n")
    (comint-send-input)
    (setq explicit-shell-file-name save-old-shell-file-name)
)
(define-key global-map "\C-c\C-i" 'start-J903-session)

(defun start-J903-session ()
    "Open J 9.03 jconsole session."
    (interactive)
    (setq save-old-shell-file-name explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/J64-903.bat"))
    (setq shell-file-name "J903_64")
    (shell)
    (insert "qts''\n")
    (insert "JVERSION\n")
    (insert "load 'ide/qt/qtlib'\n")
    (insert "read_image=: readimg_jqtide_\n")
    (insert "write_image=: writeimg_jqtide_\n")
    (insert "NB. $read_image 'Bikesgray (1).jpg'\n")
    (comint-send-input)
    (setq explicit-shell-file-name save-old-shell-file-name)
)
(define-key global-map "\C-c\C-h" 'start-J903-session)

(defun start-J9plain-session ()
    "Open J 9.01 jconsole session."
    (interactive)
    (setq save-old-shell-file-name explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/J64-901plain.bat"))
    (setq shell-file-name "J901_64-no init")
    (shell)
    (insert "qts''\n")
    (insert "JVERSION\n")
    (comint-send-input)
    (setq explicit-shell-file-name save-old-shell-file-name)
)
(define-key global-map "\C-c\C-p" 'start-J9plain-session)

(defun start-Kona-session ()
    "Open Kona console session."
    (interactive)
    (setq save-old-shell-file-name explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/k.bat"))
    (setq shell-file-name "Kona")
    (shell)
    (setq explicit-shell-file-name save-old-shell-file-name)
)
(define-key global-map "\C-c\C-k" 'start-Kona-session)

;(load "JShell.el") ; Finally works! 20141028

(defun start-Python-session ()
    "Open Python session."
    (interactive)
    (setq save-oldesfn explicit-shell-file-name)
;    (setq explicit-shell-file-name (concat base-disk "/pgm/IronPython 2.7/ipy.exe")) ; To run Python
;    (setq explicit-shell-file-name (concat base-disk "/pgm/Python27/python.exe")) ; To run Python
    (setq explicit-shell-file-name (concat base-disk "/pgm/Python37-64/python.exe")) ; To run Python
    (setq shell-file-name "Python37-64")
    (shell)
    (setq runlst (concat base-disk "/amisc/Ainfo/code/Python/.startup.py"))
    (setq runlst2 (concat "exec(compile(open('" runlst "','rb').read(), '" runlst "', 'exec'))"))

;    (insert (concat "exec(compile(open('" base-disk "/amisc/Ainfo/code/Python/.startup.py','rb').read(), '" base-disk "/amisc/Ainfo/code/Python/.startup.py', 'exec'))"))
    (insert runlst2)
    (comint-send-input)
    (setq explicit-shell-file-name save-oldesfn)
)
    ;    (setq run1st (concat "execfile(\"" base-disk "/amisc/Ainfo/code/Python/startup.py\")")) ; v. 2
    ;    (setq run1st "flnm=\"/amisc/Ainfo/code/Python/.startup.py\"\n")  ; v. 3
    ;    (setq runlst (concat runlst "exec(compile(open(\"/amisc/Ainfo/code/Python/.startup.py\",'\"rb'\").read(), \"/amisc/Ainfo/code/Python/.startup.py\", 'exec'))")) ; v. 3

(setq py-jython-command "/pgm/IronPython 2.7/ipy.exe")
(define-key global-map "\C-cP" 'start-Python-session)
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

(defun start-Python3-session ()
   "Open Python session."
   (interactive)
   (setq save-oldesfn explicit-shell-file-name)
   (setq explicit-shell-file-name (concat base-disk "/pgm/Python35-32/python.exe")) ; To run Python 3.5
   (setq shell-file-name "Python 3.7-64")
   (setq explicit-shell-file-name (concat base-disk "/pgm/Python37-64/python.exe")) ; To run Python 3.7
   (shell)
   (insert "exec(open(\"/amisc/Ainfo/code/Python/.startup.py\").read())") ; Python 3
   (comint-send-input)
   (setq explicit-shell-file-name save-oldesfn)
)
(define-key global-map "\C-c3" 'start-Python3-session)

(defun start-Matlab-session ()
    "Open Matlab session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/Program Files (x86)/MATLAB/R2011a/bin/matlab.exe")) ; To run Matlab
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-m" 'start-Matlab-session)

(defun Octave-session ()
    "Run Gnu Octave from command prompt"
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/Pgm/Octave/bin/octave-cli.exe"))
    (setq shell-file-name "Gnu Octave")
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-o" 'Octave-session)
(define-key global-map "\C-c\C-m" 'Octave-session) ; "m" because Octave is like Matlab
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
          (lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1))))
(load "octave.el")

(autoload 'q-mode "q-mode")
(add-to-list 'auto-mode-alist '("\\.[kq]\\'" . q-mode))
(defun start-q-session ()
    "Open q console session."
    (interactive)
    (setq save-old explicit-shell-file-name)
;    (setq explicit-shell-file-name (concat base-disk "/q/w32/q.exe"))
    (setq explicit-shell-file-name (concat base-disk "/Utl/q.bat"))
    (setq shell-file-name "q")
    (defvar q-prompt-regexp "^q)"
        "Prompt for `run-q'.")
    (setq comint-process-echoes t)
    (setq comint-use-prompt-regexp t)
    (shell)
    (insert "\"K-version: \",string .Q.k\n")
    (insert "now\n")
    (comint-send-input)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-q" 'start-q-session)

(defun start-R-session ()
    "Open R console session."
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/R-2.12.2.bat"))
    (setq shell-file-name "R-2.12.2")
    (setq explicit-shell-file-name (concat base-disk "/utl/R.bat"))
    (setq shell-file-name "R-3.2.2")
;    (ess-toggle-underscore nil) ; Turn off "_"->"->" in R-mode
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-cR" 'start-R-session)
; (make-comint-in-buffer "R-3.2.4 Revised" "R-3.2.4Revised160822.log" "C:/Utl/R-3.2.4Revised.bat")
; (comint-run "C:/Utl/R-3.2.4Revised.bat")

(defun VS-session ()
    "Run MS Visual Studio from command prompt"
    (interactive)
    (setq save-old explicit-shell-file-name)
    (setq explicit-shell-file-name (concat base-disk "/utl/VisualStudioCmdPrompt.bat"))
    (setq shell-file-name "MS Visual Studio")
    (shell)
    (setq explicit-shell-file-name save-old)
)
(define-key global-map "\C-c\C-v" 'VS-session)

(define-key global-map "\C-c\C-y" 'comint-previous-input)
(fset 'dedupline
   [?\C-[ ?r ?\C-q ?\C-j ?\C-q ?\C-j return ?\C-q ?\C-j return ?\C-x ?[])
(define-key global-map "\C-ccj" 'dedupline)

(define-key global-map "\C-c " 'comint-dynamic-complete-filename)
(define-key global-map " " 'self-insert-command)
;* disable-substitution-on-recall.el: prevent unwanted interpretation of !: in J.
(defun disable-substitution-on-recall()
    "Avoid unwanted interpretation of '!:' in J."
    (interactive)   ; Necessary to be able to run from interactive key sequence?
    (setq comint-input-autoexpand nil)
    (setq comint-dynamic-complete-functions nil))
;EG NB. (disable-substitution-on-recall) [C-x C-e]

;  Make rectangle grabbing more convenient.
(define-key global-map "\C-ck" 'kill-rectangle)
(define-key global-map "\C-cl" 'copy-line-to-session-end)
(define-key global-map "\C-cp" 'comint-previous-lines-run)
(define-key global-map "\C-cs" 'disable-substitution-on-recall)
(define-key global-map "\C-cw" 'grab-word-till-space-to-EOSession)
(define-key global-map "\C-cy" 'yank-rectangle)

;  Evaluate region
(define-key global-map "\C-cx" 'eval-region)
(define-key global-map "\C-xe" 'call-last-kbd-macro)

;Undefine so the following work
(define-key esc-map "[" nil)
;Defuse Ctl-Z
(define-key global-map "\C-z" 'help-for-help)
;Redefine backspace to be Delete
(define-key global-map "\C-h" 'delete-backward-char)
;Redefine Meta-r to be replace string
(global-set-key [M-r] 'replace-string)
(global-set-key [?\M-r] 'replace-string)
(define-key global-map "\er" 'replace-string)
;(global-set-key (kbd "<f9> a") "α")
(load "define-abbrev-table.el")
(abbrev-mode 1) ; turn on abbrev mode

;The following 2 cause too many problems because of confusion with their
;more useful kin, so change them to be what is usually intended.
;Disarm lowercase-region -> # of lines on this page.
(define-key global-map "\C-x\C-l" 'count-lines-page)
(define-key global-map "\C-xs" 'disable-substitution-on-recall.el)
;Disarm Uppercase-region
(define-key global-map "\C-x\C-u" 'advertised-undo)
;Disarm Ctl-d at end of interactive process
;(define-key global-map "\C-d" 'advertised-undo)

;(define-key global-map "\C-xc" 'what-cursor-position)
(define-key global-map "\C-xc" 'copy-to-register)
(define-key global-map "\C-xg" 'insert-register)
(define-key global-map "\C-xj" 'jump-to-register)
(define-key global-map "\C-xp" 'what-page)
(define-key global-map "\C-xl" 'what-line)
(define-key global-map "\C-x/" 'point-to-register)
; (define-key global-map "\C-l"  'recenter)  ; Where does this get remapped? ; 202

;; taken from match-paren.el. Author: unknown
(defun c++-match-paren ()
"Jumps to the paren matching the one under point, if there is one."
(interactive)
(let ((parse-sexp-ignore-comments c++-emacs-is-fixed-p))
(cond
 ((looking-at "[\(\[{]")
(forward-sexp 1)
(backward-char))
 ((looking-at "[])}]")
(forward-char)
(backward-sexp 1))
 (t (message "Could not find matching paren.")))))

(define-key global-map "\C-c\C-x"'c++-match-paren)

(global-set-key [f12] 'shell) ;; Command shell
(global-set-key [f14] 'undo);; Undo
(global-set-key [f15] 'delete-other-windows);; Front
(global-set-key [f17] 'find-file) ;; Open
(global-set-key [f19] 'isearch-forward) ;; Find
(global-set-key [S-f19] 'query-replace) ;; Shift Find
(global-set-key [C-f19] 'goto-line) ;; Control Find
(global-set-key [f22] 'lpr-buffer);; Print Screen
(global-set-key [S-f22] 'lpr-region);; Shift Print Screen
(global-set-key [f23] 'scroll-bar-mode) ;; Scroll Lock

(fset 'rm-blank-lines
   [?\M-x ?f ?l ?u ?s ?h ?- ?l ?i ?n ?e ?s return ?^ ?\\ ?s ?- ?* ?$ return])

(global-set-key [?\C-x ?\C-v] 'find-file-other-window)
(global-set-key [?\C-x ?\C-v] 'find-file-other-window)
(global-set-key [?\M-n] 'goto-line)
(global-set-key [?\M-N] 'what-line)

(global-set-key [C-return]
		'newline)
(global-set-key [C-backspace]
		'backward-delete-char-untabify)
(global-set-key [?\C-x ?\C-u]
		'undo)

(global-set-key [C-up]
		(lambda () "Scroll up 1 line." (interactive)
		(scroll-up (prefix-numeric-value current-prefix-arg))))

(global-set-key [C-down]
		(lambda () "Scroll down 1 line." (interactive)
		(scroll-down (prefix-numeric-value current-prefix-arg))))

(transient-mark-mode t) ;; allow mouse selection...
(setq mark-even-if-inactive t);;...and retain selection

(setq query-replace-highlight t);; highlight match

(setq require-final-newline t);; ensure files have final newline
(setq next-line-add-newlines nil) ;;...but beep when at the end of file

(line-number-mode t);; display line numbers

(setq Man-notify 'newframe) ;; display man pages in a separate frame

; (setq text-mode-hook;; default to auto-fill whenever
;'turn-on-auto-fill) ;;in text-mode
(set-fill-column 68)

(setq lpr-command "mplpr");; enables postscript printing

(require 'paren);; highlights matching paren

(setq mouse-yank-at-point t);; as opposed to yank-at-click

(require 'avoid);; mouse-avoidance-mode will temporarily
(mouse-avoidance-mode 'exile) ;;exile mouse pointer when it interferes
(require 'mouse)
(global-set-key [C-down-mouse-2];; builds an index of function definitions
		'imenu) ;;and allows selection of point from menu

(require 'font-lock);; font-lock mode

(copy-face 'default 'comment)
(copy-face 'default 'doc-string)
(copy-face 'default 'string)
(copy-face 'default 'function-name)
(copy-face 'default 'keyword)
(copy-face 'default 'type)

(setq font-lock-comment-face 'comment)
(setq font-lock-doc-string-face 'doc-string)
(setq font-lock-string-face 'string)
(setq font-lock-function-name-face 'function-name)
(setq font-lock-keyword-face 'keyword)
(setq font-lock-type-face 'type)

(set-face-foreground font-lock-comment-face "gray70")
(set-face-foreground font-lock-doc-string-face "forestgreen")
(set-face-foreground font-lock-string-face "goldenrod3")
(set-face-foreground font-lock-function-name-face "red")
(set-face-foreground font-lock-keyword-face "cyan")
(set-face-foreground font-lock-type-face "purple")

;(require 'cc-mode);; new and improved C/C++ mode ;v24.4 bad

(fmakunbound 'c-mode) ;;get rid of older modes...
(makunbound 'c-mode-map)
(fmakunbound 'c++-mode)
(makunbound 'c++-mode-map)
(makunbound 'c-style-alist)

(autoload 'c++-mode "cc-mode" ;; ...and set up new one
"C++ Editing Mode" t)
(autoload 'c-mode "cc-mode"
"C Editing Mode" t)
(setq auto-mode-alist
(append '(("\\.C$" . c++-mode) ; to edit C++ code
		("\\.cc$". c++-mode)
		("\\.cpp$" . c++-mode)
		("\\.c$" . c-mode) ; to edit C code
		("\\.h$" . c++-mode)
		) auto-mode-alist))

(add-hook 'c-mode-common-hook ;;set up standard identation style
	(lambda ()
	(c-set-offset 'block-open '-) ; {
	(c-set-offset 'case-label 2); case foo:
	(c-set-offset 'statement-case-intro 2))); printf(...

(setq rmail-delete-after-output t) ;; delete saved messages
(setq rmail-file-name;; name of default mailbox
(expand-file-name "~/.RMAIL/inbox"))
(setq rmail-secondary-file-directory ;; directory for mailboxes
(expand-file-name "~/.RMAIL"))
(setq rmail-secondary-file-regexp;; regexp for mailboxes
"^[^\.].*[^~]$")
(setq mail-archive-file-name ;; FCC: file
(expand-file-name "~/.RMAIL/.outbox"))

(put 'upcase-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(setq line-number-display-limit 19999999)

;(setq explicit-shell-file-name "C:/utl/cygwin/bin/bash.exe")  ; For bash
; This appears to work even when commented out.

;; This assumes that Cygwin is installed in C:\utl\cygwin64 (NOT the
;; default) and that C:\utl\cygwin64\bin is not already in your
;; Windows Path (it generally should not be).
;(setq explicit-shell-file-name "C:/utl/cygwin64/cygwin.bat")

(setq exec-path (cons exec-path (concat base-disk "/utl/cygwin64/bin")))
(setenv "PATH" (concat (getenv "PATH") ";" base-disk ";\\utl\\cygwin64\\bin"))
(setenv (concat (concat base-disk "\\utl\\gnuwin32\\bin;") (getenv "PATH")))
;(setenv "PATH" (concat "C:\\Program Files (x86)\\Emacs\\EmacsW32\\gnuwin32\\bin;" (getenv "PATH")))

(setq process-coding-system-alist '(("bash" . undecided-unix)))
(setq w32-quote-process-args ?\")
; Following uses, e.g. SHELL=C:/Program Files (x86)/Emacs/emacs24.4/bin/cmdproxy.exe
(setenv "SHELL" shell-file-name)
;(setq explicit-shell-file-name shell-file-name)

;; This removes unsightly ^M characters that would otherwise
;; appear in the output of java applications.
(add-hook 'comint-output-filter-functions
'comint-strip-ctrl-m)

;(setq explicit-shell-file-name "c:\\Program Files (x86)\\Emacs\\emacs\\bin\\cmdproxy.exe") ; Yay! this works

; MyCmd.bat <-> \WINNT\SYSTEM32\CMD.EXE /X /A /Q /K \UTL\SetPrmpt.bat
; where SetPrmpt.bat <-> prompt [$d $b $t $b $p]$_$g
(setq shell-file-name-chars " ")
;(defvar shell-prompt-pattern "^[^#$%>\n]*[#$%>] *")
(setq comint-prompt-regexp "^\>")
;(setq shell-prompt-pattern "^\>")
(setq shell-prompt-pattern "^[*]\n\>")
(setq shell-last-dir t)

; mat2vec: put items on successive lines onto same line w/space delim.
(fset 'mat2vec
  "\C-e \C-k")

(fset 'MSCItablizeWebPage
"C-e , C-k C-e , C-e C-k C-e , C-k C-e , C-k C-e , C-k C-e , C-k C-e ,
 C-k C-e , C-k C-a C-n")

;* wipe-all
(fset 'wipe-all
"\C-x[\C-@\C-x]\C-w")

(fset 'fix-next-header-keywd
"\C-@\C-s:\C-q\C-j\C-b\C-a\C-w\C-e \C-k\C-a\C-n")

; "\C-[" -> ESC

(fset 'Jtime-expression-with-quotes
 "\C-a6!:2 '\C-[r'''\C-e'\C-a")

(fset 'Jcomment-line
"NB. \C-a\C-n")

(fset 'Jellipsis-line
"\C-k...\C-[3\C-b\C-n")

(fset 'convert-kbd-macro-to-fset-form
 "\C-a\C-[r LFD \C-q\C-j\C-x[\C-[r\C-x[\C-[r\C-x[\C-[r\C-[\C-x[\C-x[\C-[r RET \C-q\C-j")

; Put a standard text-separator in register "l" to avoid typing it.
(set-register ?l "\n\t\t+.-----------------+.\n")
; Put common string I use in J to turn debugging off then on.
(set-register ?d "dbr 1 [ dbr 0")
; Load table of abbreviations to allow input of Unicode characters.
(set-register ?v "(load \"define-abbrev-table.el\")")

(setq remove-blank-lines
 [?\C-[ ?r ?\C-q ?\C-j ?\C-q ?\C-j return ?\C-q ?\C-j return])

; Special trim excess blank lines from FT briefing e-mails.
(fset 'FTTrym
 [?\C-[ ?x ?t ?r ?y ?m ?- return ?\C-s ?s ?u ?b ?j ?e ?c ?t ?: ?\C-a ?\C-n ?\C-@ ?\C-s ?A ?l ?l ?\C-a ?\C-p ?\C-w ?\C-n ?\C-n ?\C-@ ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n ?\C-w])

; Fix ACMList USA Address to better fit on label and not be all caps.
(fset 'fixACMUSAAddress
 [?\C-s ?\C-q ?\C-j ?U ?S ?A ?\C-q ?\C-j ?\C-p ?\C-k ?\C-k ?\C-p ?\C-p ?\C-p ?\C-e ?, ?\C-x ?/ ?b ?\C-k ?\C-e ?\C-k ?\C-x ?j ?b ?\C-b ?\C-@ ?\C-r ?\C-q ?\C-j ?\C-q ?\C-j ?\C-a ?\C-n ?\C-n ?\C-x ?/ ?a ?\C-[ ?x ?d ?o ?w ?n ?c ?a ?s ?e ?- ?r ?e ?g ?i ?o ?n return ?\C-@ ?\C-x ?j ?b ?\C-b ?\C-[ ?x ?u ?p ?c ?a ?s ?e ?- ?i ?n ?i ?t ?i ?a ?l ?s ?- ?r ?e ?g ?i ?o ?n return ?\C-a ?\C-n ?\C-n])

(fset 'Schw0ab-posn-fmt
 [?\C-@ ?\C-r ?t ?o ?t ?a ?l ?\C-a ?\C-r ?\C-r ?\C-p ?\C-p ?\C-p ?\C-w ?\C-x ?[ ?\C-@ ?\C-s ?s ?y ?m ?b ?o ?l ?\C-a ?\C-w ?\C-[ ?9 ?\C-[ ?x ?d ?e ?t ?r return ?\C-c ?c ?j])

; Repeat this for as many positions as need to be formatted -> .CSV
(fset 'Schw1ab-posn-fmt
 "\C-f\"\C-e\",\C-k\"\C-e\",\C-k\C-f\"\C-e\",\C-k\C-f\"\C-e\",\C-k\C-f\"\C-e\",\C-k\C-f\"\C-e\"\C-k\C-k\C-a\C-n")

(fset 'Citi0-posn-fmt
 "\C-@\C-rTotal*\C-w\C-b\C-a\C-n\C-w\C-x[\C-@\C-sDescription Quantity\C-a\C-w")

; Repeat these 2 for as many positions as need to be formatted -> .CSV
(fset 'Citi1-posn-fmt
 "\C-s(\C-b,\C-s)\C-b\C-f,\C-f\C-s \C-b,\C-f\C-s\C-s\C-b,\C-f\C-s\C-s\C-b,\C-b\C-k\C-a\C-n")
(fset 'Citi2-posn-fmt ; Switch position of 1st 2 fields.
 "\C-s,\C-f\C-@\C-f\C-s,\C-b\C-f\C-w\C-a\C-y \C-a\C-n")

; Convert rows in buffer to quoted enclosed items of J list.
(fset 'rows-to-enclose
 [?\C-x ?/ ?a ?\C-[ ?r ?\C-q ?\C-j return ?' ?; ?' return backspace backspace ?\C-r ?; ?\C-f ?< ?\C-a ?' ?\C-a])

(define-key global-map "\C-l"  'recenter)  ; Where does this get remapped? ; l. 532
(setq lpr-command "print")
;;Use the alt key as meta:
(setq win32-alt-is-meta t); Emacs 19
;(setq w32-alt-is-meta t); Emacs 20

;; noweb mode
(autoload 'noweb-mode "noweb-mode" "Editing noweb files." t)
(setq auto-mode-alist (append (list (cons "\\.nw$" 'noweb-mode))
auto-mode-alist))

;; auctex
(fset 'last-word-grab
 "\C-e\C-r \C-f\C-k\C-xu\C-x]")

(fset 'create-CD-dir
 [?\C-e ?\C-r ?\C-f ?\C-k ?\C-x ?u ?\C-x ?] ?d ?i ?r ?/ ?o ?- ?d ?/ ?s ?D ?: ?\\ ?> ?\C-y ?. ?d ?i ?r return])
(global-set-key [f1] 'create-CD-dir)

(fset 'Homecreate-CD-dir
 [?\C-e ?\C-r ?\C-f ?\C-k ?\C-x ?u ?\C-x ?] ?d ?i ?r ?/ ?o ?- ?d ?/ ?s ?E ?: ?\\ ?> ?\C-y ?. ?d ?i ?r return])
(global-set-key [f1] 'Homecreate-CD-dir)
; for home use - CD drive is E:

(fset 'create-CD-dir
   [?\C-s ?V ?o ?l ?u ?m ?e ?  ?i ?n ?  ?d ?r ?i ?v ?e ?\C-f ?\C-k ?\C-x ?u ?\C-x ?] ?d ?i ?r ?  ?/ ?o ?- ?d ? ?/ ?S ?  ?\C-y ?\C-r ?i ?s ?\C-b ?: ?\\ ?  ?> ?\C-d ?\C-d ?\C-d ?\C-e ?. ?d ?i ?r return])

(global-set-key [f3] 'create-CD-dir)
; For work and home-use CD drive is "D:".

(display-time)
(display-time-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)   ; Change yes/no prompts to y/n

;; Zach's newer j-mode:
;(load "j-mode") ;ex 20210307
;(autoload 'j-mode "j-mode.el""Major mode for J." t) ;ex 20210307
;(autoload 'j-shell "j-mode.el" "Run J from emacs." t) ;ex 20210307
;(setq auto-mode-alist ;ex 20210307
;(cons '("\\.ij[rstp]" . j-mode) auto-mode-alist)) ;ex 20210307
;(setq j-path "C:\\Program Files (x86)\\J64-701\\")
(setq j-path (concat pgm-dir-home "J64-902\\"))
;(which-func-mode 1) ; shows the current function in statusbar

; Grab current directory from prompt and change emacs dir to it.
(fset 'LISP-cd-currdir
   [?\C-r ?: ?\C-b ?\C-k ?\C-x ?u ?\C-x ?] ?c ?d ?  ?\C-y backspace return])

; format e-mail, grabbed from g-mail, to look neater.
(fset 'fmt-gmail
   [?\C-s ?f ?r ?o ?m ?\C-f backspace ?  ?\C-f ?\C-s ?h ?i ?d ?\C-b ?\C-b ?\C-b ?\C-@ escape ?f escape ?f ?\C-w ?\C-d backspace backspace backspace ?\C-a ?\C-n ?\C-d ?\C-n ?\C-d ?\C-n ?\C-d ?\C-n ?\C-d ?\C-e return ?\C-p ?\C-p ?\C-p ?\C-p ?\C-f ?\C-s ?- ?t ?o ?\C-f ?\C-d backspace ?  ?\C-n backspace ?  ?\C-n backspace ?  ?\C-n backspace ? ])

(fset 'cvtExcelMat-to-J
 [?\C-x ?/ ?a escape ?r ?- return ?_ return ?\C-x ?j ?a escape ?r ?\C-q tab return return ?\C-x ?j ?a escape ?r ?\C-q ?\C-j return ?, return ?\C-r ?, ?\C-d ?\C-r ?\C-r ?\C-b ?\C-f ?\C-f ?: ?\C-x ?j ?a])
; Attempt to foil command retrieval in J messing w/e.g. "6!:2"
(setq comint-input-autoexpand nil)
; This succeeds.
(setq comint-dynamic-complete-functions nil)

(fset 'time-this-line
   [?\C-k ?\C-x ?b ?* ?t ?i ?m ?e ?l ?i ?n ?e return ?\C-y ?\C-a escape ?r ?' return ?' ?' return ?\C-e ?' ?\C-a ?6 ?! ?: ?2 ?  ?' ?\C-a ?\C-k ?\C-x ?k return ?\C-y])

(fset 'default-directory-set-current
   [?\C-k ?\C-x ?b ?* ?s ?e ?t ?d ?d ?* return ?\C-y ?\C-a ?( ?s ?e ?t ?q ?  ?d ?e ?f ?a ?u ?l ?t ?- ?d ?i ?r ?e ?c ?t ?o ?r ?y ?  ?" escape ?r ?\\ return ?\\ ?\\ return ?\C-a escape ?r ?\\ ?\\ ?\\ ?\\ return ?\\ ?\\ return ?\C-e ?" ?) ?\C-@ ?\C-a ?\M-x ?e ?v ?a ?l ?- ?r ?e ?g ?i ?o ?n return ?\C-k ?\C-x ?k return ?\C-y ?\C-a ?N ?B ?. ?  ?\C-@ ?\C-e ?\C-c ?x])

(fset 'set-shell-mode
   [?\M-x ?s ?h ?e ?l ?l ?- ?m ?o ?d ?e return return])

(fset 'current-directory-to-default
   [?\C-r ?  ?\C-f ?\C-k ?\C-x ?u ?\C-n ?R ?e ?m ?  ?\C-y backspace ?\C-a ?\C-f ?\C-f ?\C-f ?\M-x ?j ?- ?m ?o ?d ?e return ?\C-f escape ?r ?\\ return ?\\ ?\\ return ?\C-e ?\\ ?\\ ?" ?) ?\C-a ?\C-f ?\C-f ?\C-f ?\C-f ?( ?s ?e ?t ?q ?  ?d ?e ?f ?a ?u ?l ?t ?- ?d ?i ?r ?e ?c ?t ?o ?r ?y ?  ?" ?\C-e return \M-x ?s ?h ?e ?l ?l ?- ?m ?o ?d ?e return])

; Copy from point to end of line to session end, move to start.
(fset 'copy-line-to-session-end
   "\C-@\C-e\367\C-x]\C-y\C-a")
;* first-last-to-lcf: Turn line of "first,TAB,last" name into "last, first"
(fset 'first-last-to-lcf
   [?\C-e ?\C-r ?\C-q tab ?\C-f ?\C-k backspace ?\C-a ?\C-y ?, ?  ?\C-e ?\; ?\C-a ?\C-n])
(fset 'comint-previous-lines-run
   "\C-rcomint\C-r\C-r\C-a\C-f\C-f\C-f\C-f\C-f\C-@\C-e\C-b\C-cx\C-n\C-s\C-s\C-n\C-a\C-f\C-f\C-f\C-f\C-f\C-@\C-e\C-b\C-cx\C-x]")
(fset 'HTML-ampersubs-undo
   [escape ?r ?& ?l ?t ?\; return ?< return ?\C-x ?[ escape ?r ?& ?g ?t ?\; return ?> return ?\C-x ?[ escape ?r ?& ?a ?m ?p ?\; return ?& return])

(setq auto-save-list-file-prefix "~/Temp/.emacs.d/.saves-")
;* remove-eols: replace single EOL w/space, double EOL w/single EOL.
(fset 'remove-eols
   [escape ?r ?\C-q ?\C-j ?\C-q ?\C-j return ?  ?- ?_ ?- ?  return ?\C-x ?[ escape ?r ?\C-q ?\C-j return ?  return ?\C-x ?[ escape ?r ?  ?- ?_ ?- ?  return ?\C-q ?\C-j return])

(fset 'grab-word-till-space-to-EOSession
   [?\C-@ ?\C-s ?  ?\C-b ?\M-w ?\C-x ?] ?\C-y ?\C-a backspace ?  ?\C-e ? ])

(fset 'grab-line-from-other-buffer
   [?\C-x ?b return ?\C-k ?\C-x ?u ?\C-n ?\C-x ?b return ?\C-y return])

;* append-this-logfile-to-top: put contents of file at cursor at top of current session.
(fset 'append-this-logfile-to-top
   [?\C-c ?e ?\C-f ?\C-@ ?\C-x ?\] ?\M-w ?\C-x ?k return ?\C-x ?\[ ?\C-y ?\C-x ?\] ?\C-p ?\C-p ?\C-p ?\C-c ?g ?\C-f ?\C-a])

; load custom settings (faces)
;(setq custom-file (concat base-disk "/.emacs-custom.el")) ;ex 20210307
;(load custom-file) ;ex 20210307

(setq ftp-program-name (concat base-disk "\\utl\\gnuwin32\\bin\\ftp.exe"))
(setq ftp-default-user 'clarifi)
(setq ftp-default-password '2o14!$upp0rT)

; R stuff:
; automatically get the correct mode
auto-mode-alist (append (list '("\\.c$" . c-mode)
                              '("\\.emacs" . emacs-lisp-mode)
			      '("\\.html$" . html-mode)
			      '("\\.ijs$" . j-mode)
			      '("\\.ijx$" . j-mode)
			      '("\\.R$" . R-mode)
			      '("\\.r$" . R-mode)
			      '("\\.S$" . S-mode)
			      '("\\.s$" . S-mode)
			      '("\\.tex$" . latex-mode)
	                )
		      auto-mode-alist)
(load (concat EmacsBase "addons/ess-18.10.2/lisp/ess.el"))
;c:/Users/devon/emacs26.3/addons/ess-18.10.2/lisp
(setq-default inferior-R-program-name (concat base-disk "/utl/R.bat"))
(load "forceUTF-8-coding")  ; From http://www.masteringemacs.org/article/working-coding-systems-unicode-emacs

;* fix-EOLS-in-text: replace single EOLs w/spaces but double ones w/single ones.
(fset 'fix-EOLS-in-text
   [escape ?r C-tab ?\C-q ?\C-j ?\C-q ?\C-j return ?_ ?= ?+ ?- ?  return ?\C-x ?\[ escape ?r ?\C-q ?\C-j return ?  return ?\C-x ?\[ escape ?r ?- backspace ?_ ?= ?+ ?- ?  return ?\C-q ?\C-j return])

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;* sort-wiki-table: Given wiki table entries as text starting
; with "|-^J", join and sort line-pairs, then undo join->pairs.
(fset 'sort-wiki-table
   [escape ?r ?| ?- ?\C-q ?\C-j return ?| ?- return ?\C-x ?\[ ?\C-@ ?\C-x ?\] ?\M-x ?s ?o ?r ?t ?  ?l ?i ?n ?e ?s return ?\C-x ?\[ escape ?r ?| ?- ?| return ?| ?- ?Q ?J backspace backspace ?\C-q ?\C-j ?| return])

; Filename completion
(progn
 (define-key minibuffer-local-completion-map " " 'minibuffer-complete-word)
 (define-key minibuffer-local-filename-completion-map " " 'minibuffer-complete-word)
 (define-key minibuffer-local-must-match-filename-map " " 'minibuffer-complete-word)
)

; Move emacs deletions to recycle bin.
(setq delete-by-moving-to-trash t)
; Create a menu item File -> Open recent.
(require 'recentf)
(recentf-mode 1)
; Turn off initial start-up screen
(setq inhibit-startup-screen t)
; Open files in a running instance of Emacs:
;(server-start)
; ^Gives error: The directory '~/.emacs.d/server' is unsafe

(setq explicit-shell-file-name (concat base-disk "/Utl/MyCmd.bat")) ; To run DOS command shell w/my prompt.
(turn-on-iimage-mode)
(iimage-mode-buffer t)
; (ansi-term (concat base-disk "/Utl/MyCmd.bat"))

;(setq auto-complete 1)
(shell)
; Enable directory-tracking in shell: have to do this after starting shell.
(load "baw-tracker.el")

; Change to base disk: send command to shell just opened.
(insert base-disk)
(comint-send-input)
; Set emacs's base dir.
(setq default-directory (concat base-disk "\\amisc\\"))

; Change to logs: send command to shell just opened.
(insert "cd \\amisc\\logs")
(comint-send-input)
(insert "t5")
(comint-send-input)
(insert "setprmpt")
(comint-send-input)

(put 'downcase-region 'disabled nil)

(fset 'remove-EOLs-but-leave-paragraph-breaks
   [escape ?r ?\C-q ?\C-j ?\C-q ?\C-j return ?- ?  ?+ ?  ?- return ?\C-x ?[ escape ?r ?\C-q ?\C-j return ?  return ?\C-x ?[ escape ?r ?- ?  ?+ ?  ?- return ?\C-q ?\C-j ?\C-q ?\C-j return])

(fset 'rm-companyName-txt
   [?\C-s ?c ?o ?m ?p ?a ?n ?y ?  ?n ?a ?m ?e ?\C-f ?\C-b return ?\C-p ?\C-k ?\C-k ?\C-s ?c ?o ?m ?p ?a ?n ?y ?  ?l ?o ?c ?a ?t ?i ?o ?n ?\C-f ?\C-w ?\C-x ?u return ?\C-p ?\C-s ?\C-s ?\C-w ?\C-x ?u return ?\C-p ?\C-s ?\C-s ?\C-b ?\C-b ?\C-b ?\C-b ?\C-r ?\C-r ?\C-b ?\C-b ?\C-f ?\C-f backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace backspace ?\C-a ?\C-n ?\C-s ?p ?o ?s ?t ?e ?d ?  ?d ?a ?t ?e ?\C-b ?\C-f return ?\C-p ?\C-k ?\C-k])

(fset 'replace-logfile-with-last-saved
   [?d ?e ?l ?  return ?r ?e ?n ?  ?\" ?# ?\C-y ?# ?\" ?  ?\C-y return])

(fset 'rm-misc-company-etc-info
   [?\C-s ?C ?o ?m ?p ?a ?n ?y ?  ?N ?a ?m ?e ?\C-f ?\C-b return ?\C-p ?\C-k ?\C-k ?\C-s ?C ?o ?m ?p ?a ?n ?y ?  ?L ?o ?c ?a ?t ?i ?o ?n ?\C-f return ?\C-p ?\C-s ?\C-s ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-k ?\C-n ?\C-a ?\C-s ?P ?o ?s ?t ?e ?d ?  ?D ?a ?t ?e ?\C-b ?\C-f return ?\C-p ?\C-k ?\C-k ?\C-s ?N ?u ?m ?b ?e ?r ?  ?o ?f ?  ?v ?i ?e ?w ?s ?\C-b ?\C-f return ?\C-p ?\C-s ?\C-s ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b ?\C-k])
   
(desktop-save-mode 1)
