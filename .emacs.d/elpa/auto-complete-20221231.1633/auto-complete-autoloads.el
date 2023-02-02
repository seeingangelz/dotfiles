;;; auto-complete-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "auto-complete" "auto-complete.el" (0 0 0 0))
;;; Generated autoloads from auto-complete.el

(autoload 'auto-complete "auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete" "\
AutoComplete mode

This is a minor mode.  If called interactively, toggle the
`Auto-Complete mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `auto-complete-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'global-auto-complete-mode 'globalized-minor-mode t)

(defvar global-auto-complete-mode nil "\
Non-nil if Global Auto-Complete mode is enabled.
See the `global-auto-complete-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global Auto-Complete mode if ARG is positive;
otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.

See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "auto-complete" '("ac-" "auto-complete-mode"))

;;;***

;;;### (autoloads nil "auto-complete-config" "auto-complete-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete-config.el

(autoload 'ac-config-default "auto-complete-config" "\
No documentation." nil nil)

(register-definition-prefixes "auto-complete-config" '("ac-"))

;;;***

;;;### (autoloads nil nil ("auto-complete-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-complete-autoloads.el ends here
