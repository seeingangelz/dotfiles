;;; ewal.el --- A pywal-based theme generator -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Uros Perisic
;; Copyright (C) 2019 Grant Shangreaux
;; Copyright (C) 2016-2018 Henrik Lissner

;; Author: Uros Perisic
;; URL: https://gitlab.com/jjzmajic/ewal
;;
;; Version: 0.2
;; Keywords: faces
;; Package-Requires: ((emacs "25.1"))

;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
;; details.

;; You should have received a copy of the GNU General Public License along with
;; this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;; A dependency-free, pywal-based, automatic, terminal-aware Emacs
;; color-picker and theme generator.

;; My hope is that `ewal' will remain theme agnostic, with people
;; contributing functions like `ewal-get-spacemacs-theme-colors' from
;; `ewal-spacemacs-themes' for other popular themes such as
;; `solarized-emacs' <https://github.com/bbatsov/solarized-emacs>,
;; making it easy to keep the style of different themes, while
;; adapting them to the rest of your theming setup.  No problem should
;; ever have to be solved twice!

;;; Code:

;; deps
(require 'cl-lib)
(require 'color)
(require 'json)
;; (require 'term/tty-colors)

(defgroup ewal nil
  "ewal options."
  :group 'faces)

(defcustom ewal-json-file "~/.cache/wal/colors.json"
  "Location of ewal theme in json format."
  :type 'string
  :group 'ewal)

(defcustom ewal-ansi-color-name-symbols
  (mapcar #'intern
          (cl-loop for (key . _value)
                   in tty-defined-color-alist
                   collect key))
  "The 8 most universaly supported TTY color names.
They will be extracted from `ewal--cache-json-file', and with the
right escape sequences applied using:

#+BEGIN_SRC shell
${HOME}/.cache/wal/colors-tty.sh
#+END_SRC

The colors should be viewable even in the Linux console (See
https://github.com/dylanaraps/pywal/wiki/Getting-Started#applying-the-theme-to-new-terminals
for more details).  NOTE: Order matters."
  :type 'list
  :group 'ewal)

(defcustom ewal-force-tty-colors-in-daemon-p nil
  "Whether to use TTY version of `ewal' colors in Emacs daemon.
It's a numbers game.  Set to t if you connect to your Emacs
server from a TTY most of the time, unless you want to run `ewal'
every time you connect with `emacsclient'."
  :type 'boolean
  :group 'ewal)

(defcustom ewal-force-tty-colors-p nil
  "Whether to use TTY version of `ewal' colors.
Meant for setting TTY theme regardless of GUI support."
  :type 'boolean
  :group 'ewal)

(defcustom ewal-dark-palette-p t
  "Assume `ewal' theme is a dark theme.
Relevant either when using `ewal's built-in palettes, or when
guessing which colors to use as the special \"background\" and
\"foreground\" `wal' colors."
  :type 'boolean
  :group 'ewal)

(defcustom ewal-built-in-palette "sexy-material"
  "Whether to skip reading the `wal' cache and use built-in palettes.
Only applies when `wal' cache is unreadable for some reason."
  :type 'string
  :group 'ewal)

(defcustom ewal-use-built-in-always-p nil
  "Whether to skip reading the `wal' cache and use built-in palettes."
  :type 'boolean
  :group 'ewal)

(defcustom ewal-use-built-in-on-failure-p t
  "Whether to skip reading the `wal' cache and use built-in palettes.
Only applies when `wal' cache is unreadable for some reason."
  :type 'boolean
  :group 'ewal)

(defcustom ewal-primary-accent-color 'magenta
  "Predominant `ewal' color.
Must be one of `ewal-ansi-color-name-symbols'"
  :type 'symbol
  :group 'ewal)

(defcustom ewal-secondary-accent-color 'blue
  "Second most predominant `ewal' color.
Must be one of `ewal-ansi-color-name-symbols'"
  :type 'symbol
  :group 'ewal)

(defcustom ewal-ansi-cursor-color
  (symbol-name ewal-primary-accent-color)
  "Assumed color of special \"cursor\" color in `wal' themes.
Only relevant in TTY/terminal."
  :type 'string
  :group 'ewal)

(defvar ewal-built-in-json-file
  (concat (file-name-directory load-file-name)
          "palettes/"
          (if ewal-dark-palette-p "dark/" "light/")
          ewal-built-in-palette
          ".json")
  "Json file to be used in case `ewal-use-built-in-always-p' is t.
Also if `ewal-use-built-in-on-failure-p' is t and something goes wrong.")

(defvar ewal-ansi-background-color
  (if ewal-dark-palette-p "black" "white")
  "Ansi color to use for background in a TTY/terminal.")

(defvar ewal-ansi-comment-color
  (if ewal-dark-palette-p "black" "white")
  "Ansi color to use for background in TTY/terminal.")

(defvar ewal-ansi-foreground-color
  (if ewal-dark-palette-p "white" "black")
  "Ansi color to use for background in TTY/terminal.")

(defvar ewal-base-palette nil
  "Current base palette extracted from `ewal-json-file'.")

(defvar ewal-shade-percent-difference 5
  "Default percentage difference between each shade.")

;;;###autoload
(defun ewal-load-colors (&optional json color-names)
  "Read JSON as the most complete of the cached wal files.
COLOR-NAMES will be associated with the first 8 colors of the
cached wal colors.  COLOR-NAMES are meant to be used in
conjunction with `ewal-ansi-color-name-symbols'.  \"Special\" wal
colors such as \"background\", \"foreground\", and \"cursor\",
tend to \(but do not always\) correspond to the remaining colors
generated by wal. Add those special colors to the returned
alist. Return nil on failure."
  (condition-case nil
      (let* ((json (or json ewal-json-file))
             (json-object-type 'alist)
             (json-array-type 'list)
             (color-names (or color-names ewal-ansi-color-name-symbols))
             (colors (json-read-file json))
             (special-colors (alist-get 'special colors))
             (regular-colors (alist-get 'colors colors))
             (regular-color-values (cl-loop for (_key . value)
                                            in regular-colors
                                            collect value))
             (cannonical-colors (cl-pairlis color-names regular-color-values)))
        ;; unofficial comment color (always used as such)
        (cl-pushnew (cons 'comment (nth 8 regular-color-values)) special-colors)
        (setq ewal-base-palette (append special-colors cannonical-colors)))
    (error nil))
  ewal-base-palette)

(defun ewal--get-base-color (color)
  "Fetch COLOR from `ewal-base-palette'."
  (alist-get color ewal-base-palette))

;; Color helper functions, shamelessly *borrowed* from solarized
(defun ewal--color-name-to-rgb (color)
  "Retrieves the hex string represented the named COLOR (e.g. \"red\")."
  (cl-loop with div = (float (car (tty-color-standard-values "#ffffff")))
           for x in (tty-color-standard-values (downcase color))
           collect (/ x div)))

(defun ewal--color-blend (color1 color2 alpha)
  "Blend COLOR1 and COLOR2 (hex strings) together by a coefficient ALPHA.
\(a float between 0 and 1\)"
  (when (and color1 color2)
    (cond ((and color1 color2 (symbolp color1) (symbolp color2))
           (ewal--color-blend (ewal-get-color color1 0)
                              (ewal-get-color color2 0) alpha))

          ((or (listp color1) (listp color2))
           (cl-loop for x in color1
                    when (if (listp color2) (pop color2) color2)
                    collect (ewal--color-blend x it alpha)))

          ((and (string-prefix-p "#" color1) (string-prefix-p "#" color2))
           (apply (lambda (r g b) (format "#%02x%02x%02x"
                                          (* r 255) (* g 255) (* b 255)))
                  (cl-loop for it    in (ewal--color-name-to-rgb color1)
                           for other in (ewal--color-name-to-rgb color2)
                           collect (+ (* alpha it) (* other (- 1 alpha))))))

          (t color1))))

(defun ewal--color-chshade (color alpha)
  "Change shade of COLOR \(a hexidecimal string\) by ALPHA.
\(a float between -1 and 1\)."
  (cond ((and color (symbolp color))
         (ewal--color-chshade (ewal--get-base-color color) alpha))
        ((listp color)
         (cl-loop for c in color collect (ewal--color-chshade c alpha)))
        (t
         (if (> alpha 0)
             (ewal--color-blend "#FFFFFF" color alpha)
           (ewal--color-blend "#000000" color (* -1 alpha))))))

(defun ewal-get-color
    (color &optional shade shade-percent-difference)
  "Get an `ewal' color.
Return SHADE of COLOR with SHADE-PERCENT-DIFFERENCE between
shades."
  (let ((tty (or ewal-force-tty-colors-p
                 (and (daemonp) ewal-force-tty-colors-in-daemon-p)
                 (and (not (daemonp)) (not (display-graphic-p)))))
        (shade (or shade 0))
        (shade-percent-difference
         (or shade-percent-difference
             ewal-shade-percent-difference)))
    (if tty
        (let ((color-name (symbol-name color)))
          (concat (if (or (string= color-name "comment") (> shade 0)) "bright" "")
                  (cond ((string= color-name "background") ewal-ansi-background-color)
                        ((string= color-name "foreground") ewal-ansi-foreground-color)
                        ((string= color-name "comment") ewal-ansi-comment-color)
                        ((string= color-name "cursor") ewal-ansi-cursor-color)
                        (t color-name))))
      (if (or (not shade) (= shade 0))
          (ewal--get-base-color color)
        (ewal--color-chshade
         color (/ (* shade shade-percent-difference) (float 100)))))))

;;;###autoload
(defun ewal-load-color (color &optional shade shade-percent-difference)
  "Same as `ewal-get-color' but call `ewal-load-ewal-colors' first.
Pass COLOR, SHADE, and SHADE-PERCENT-DIFFERENCE to
`ewal-get-color'.  Meant to be called from user config."
  (ewal-load-colors)
  (ewal-get-color color shade shade-percent-difference))

(provide 'ewal)

;;; ewal.el ends here
