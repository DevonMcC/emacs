(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(archive-zip-expunge (quote (concat base-disk "\\utl\\zip" "-d" "-q")))
 '(archive-zip-extract (quote (concat base-disk "\\utl\\unzip" "-qq" "-c")))
 '(archive-zip-update (quote ((concat base-disk "\\utl\\zip" "-q"))))
 '(archive-zip-update-case (quote (concat base-disk "\\utl\\zip" "-q" "-k")))
 '(j-command "jconsole.exe ")
 '(j-command-args (quote (concat base-disk "\\amisc\\Jsys\\J7\\DHMConfig.ijs")))
 '(j-path (concat base-disk "\\Program Files (x86)\\j64-701\\") t)
 '(w32shell-cygwin-bin (concat base-disk "/utl/cygwin/bin")))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((((min-colors 88) (background dark)) (:foreground "cyan1"))))
 '(comment ((t (:inherit nil :stipple nil :background "black" :foreground "yellow" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New"))) t)
 '(doc-string ((t (:inherit nil :stipple nil :background "black" :foreground "light green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New"))) t)
 '(eshell-prompt ((t (:foreground "Light Green" :weight bold))))
 '(keyword ((t (:inherit nil :stipple nil :background "black" :foreground "cyan" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New"))) t)
 '(string ((t (:inherit nil :stipple nil :background "black" :foreground "goldenrod1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New"))) t))

; Put some commonly used strings (usually paths) into registers for quick retrieval.
(set-register ?f "'fltit fl'=. split readTSVFl flnm")
; Usual J phrase to turn off debug and back on again
(set-register ?d "dbr 1 [ dbr 0")
(set-register ?j "\\amisc\\JSys\\user\\code\\")
; Put a standard text-separator in register "l" to avoid typing it.
(set-register ?l "\n\t\t+.-----------------+.\n")
(set-register ?n "qts'' [ 0 \: 0 [ smoutput qts''")
(set-register ?o "\\amisc\\ofldinfo\\")
(set-register ?p "\\amisc\\Ainfo\\phonum\\")
(set-register ?r (concat "6!:2 '1!:44 svdir[(3 : ''shell ''''rmxs''''[1!:44 y'') generalWalkTree ''" base-disk "''[svdir=. 1!:43 '''''"))

(set-frame-size (selected-frame) 80 42)  ; Most screens
(set-frame-size (selected-frame) 80 32)  ; Smaller, e.g. Lenovo laptop, screen
(set-frame-position (selected-frame) 380 20)

;* insert-previous-logfile-and-save-over-it: assume name of log
; file is last one on line above (after t5 or dir /od): insert its
; contents at start of current buffer, then save this buffer as
; same file.
(setq insert-previous-logfile-and-save-over-it
   [?\C-p ?\C-p ?\C-p ?\C-c ?e ?\C-f ?\C-x ?\[ ?\C-@ ?\C-x ?\] ?\M-w ?\C-x ?k return ?\C-x ?\[ ?\C-y ?\C-x ?\] ?\C-p ?\C-p ?\C-p ?\C-c ?g ?\C-f ?\C-a ?\C-k ?\C-x ?\C-w ?\C-y return ?y])

(setq default-directory "\\amisc\\Clarifi\\")
