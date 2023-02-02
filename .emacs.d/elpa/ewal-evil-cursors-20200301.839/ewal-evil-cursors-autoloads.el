;;; ewal-evil-cursors-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ewal-evil-cursors" "ewal-evil-cursors.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ewal-evil-cursors.el

(autoload 'ewal-evil-cursors-highlight-face-evil-state "ewal-evil-cursors" "\
Set highlight face depending on the evil state.
Set `spaceline-highlight-face-func' to
`ewal-evil-cursors-highlight-face-evil-state' to use this." nil nil)

(autoload 'ewal-evil-cursors-get-colors "ewal-evil-cursors" "\
Get `ewal-evil-cursors' colors.
If APPLY is t, set relevant environment variable for the user.
If SPACEMACS is t, target Spacemacs-relevant variables.  Tweak
spaceline to use `ewal' colors if SPACELINE is t.  Reload `ewal'
environment variables before returning colors even if they have
already been computed if FORCE-RELOAD is t.

\(fn &key APPLY SPACEMACS SPACELINE)" nil nil)

(register-definition-prefixes "ewal-evil-cursors" '("ewal-evil-cursors-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ewal-evil-cursors-autoloads.el ends here
