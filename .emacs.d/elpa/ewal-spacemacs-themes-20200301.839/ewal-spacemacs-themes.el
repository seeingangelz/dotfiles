;;; ewal-spacemacs-themes.el --- Ride the rainbow spaceship -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Uros Perisic

;; Author: Uros Perisic
;; URL: https://gitlab.com/jjzmajic/ewal
;;
;; Version: 0.1
;; Keywords: faces
;; Package-Requires: ((emacs "25") (ewal "0.1") (spacemacs-theme "0.1"))

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

;; An `ewal'-based theme pack, created using `spacemacs-theme'
;; <https://github.com/nashamri/spacemacs-theme> as its base.  Emulate
;; this file if you want to contribute other `ewal' customized themes.

;;; Code:
(require 'ewal)

(defvar ewal-spacemacs-themes-colors nil
  "`spacemacs-theme' compatible colors.
Extracted from current `ewal' theme.")

(defun ewal-spacemacs-themes--generate-colors (&optional borders)
  "Make theme colorscheme from theme palettes. If BORDERS is t
use `ewal-primary-accent-color' for borders."
  (let ((tty (or ewal-force-tty-colors-p
                 (and (daemonp) ewal-force-tty-colors-in-daemon-p)
                 (and (not (daemonp)) (not (display-graphic-p)))))
        (bg1 (ewal-get-color 'background 0))
        (bg2 (ewal-get-color 'background -2))
        (bg3 (ewal-get-color 'background -3))
        (bg4 (ewal-get-color 'background -4))
        (act1 (ewal-get-color 'background -3))
        (act2 (ewal-get-color ewal-primary-accent-color 0))
        (base (ewal-get-color 'foreground 0))
        (base-dim (ewal-get-color 'foreground -4))
        (comment (ewal-get-color 'comment 0))
        (border (ewal-get-color (if borders
                                     ewal-primary-accent-color
                                   'background) 0))
        (cblk (ewal-get-color 'background -3))
        (const (ewal-get-color ewal-primary-accent-color 4))
        (cblk-ln-bg (ewal-get-color ewal-primary-accent-color -4))
        (cursor (ewal-get-color 'cursor 0))
        (comp (ewal-get-color ewal-secondary-accent-color 0))
        (red  (ewal-get-color 'red 0))
        (highlight (ewal-get-color 'background 4))
        (highlight-dim (ewal-get-color 'background 2))
        (cyan (ewal-get-color 'cyan 0))
        (yellow (ewal-get-color 'yellow 0))
        (green (ewal-get-color 'green 0))
        (suc (ewal-get-color 'green 4))
        (type (ewal-get-color 'red 2))
        (var (ewal-get-color ewal-secondary-accent-color 4))
        (aqua-bg (ewal-get-color 'cyan -3))
        (green-bg (ewal-get-color 'green -3))
        (green-bg-s  (ewal-get-color 'green -4))
        (red-bg (ewal-get-color 'red -3))
        (red-bg-s (ewal-get-color 'red -4))
        (blue (ewal-get-color 'blue 0))
        (blue-bg (ewal-get-color 'blue -3))
        (blue-bg-s (ewal-get-color 'blue -4))
        (magenta (ewal-get-color 'magenta 0))
        (yellow-bg (ewal-get-color 'yellow -3)))
    `((act1          . ,act1)
      (act2          . ,act2)
      (base          . ,base)
      (base-dim      . ,base-dim)
      (bg1           . ,bg1)
      ;; used to highlight current line
      (bg2           . ,(if tty comment bg2))
      (bg3           . ,bg3)
      (bg4           . ,bg4)
      (border        . ,border)
      (cblk          . ,base)
      (cblk-bg       . ,cblk)
      (cblk-ln       . ,const)
      (cblk-ln-bg    . ,cblk-ln-bg)
      (cursor        . ,cursor)
      (const         . ,const)
      (comment       . ,comment)
      (comment-bg    . ,bg1)
      (comp          . ,comp)
      (err           . ,red)
      (func          . ,act2)
      (head1         . ,act2)
      (head1-bg      . ,act1)
      (head2         . ,comp)
      (head2-bg      . ,bg3)
      (head3         . ,cyan)
      (head3-bg      . ,bg3)
      (head4         . ,yellow)
      (head4-bg      . ,bg3)
      (highlight     . ,highlight)
      (highlight-dim . ,highlight-dim)
      (keyword       . ,comp)
      (lnum          . ,comment)
      (mat           . ,green)
      (meta          . ,yellow)
      (str           . ,cyan)
      (suc           . ,suc)
      (ttip          . ,comment)
      (ttip-sl       . ,bg2)
      (ttip-bg       . ,bg1)
      (type          . ,type)
      (var           . ,var)
      (war           . ,yellow)
      ;; colors
      (aqua          . ,cyan)
      (aqua-bg       . ,aqua-bg)
      (green         . ,green)
      (green-bg      . ,green-bg)
      (green-bg-s    . ,green-bg-s)
      ;; the same as `aqua' in web development
      (cyan          . ,cyan)
      (red           . ,red)
      (red-bg        . ,red-bg)
      (red-bg-s      . ,red-bg-s)
      (blue          . ,blue)
      (blue-bg       . ,blue-bg)
      (blue-bg-s     . ,blue-bg-s)
      (magenta       . ,magenta)
      (yellow        . ,yellow)
      (yellow-bg     . ,yellow-bg))))

;;;###autoload
(cl-defun ewal-spacemacs-themes-get-colors
    (&optional borders)
  "Get `spacemacs-theme' colors.
For usage see: <https://github.com/nashamri/spacemacs-theme>."
  (ewal-load-colors)
  (setq ewal-spacemacs-themes-colors
        (ewal-spacemacs-themes--generate-colors borders))
  ewal-spacemacs-themes-colors)

(defun ewal-spacemacs-themes--modernize-theme (theme)
  "Modernize an ewal-spacemacs-themes THEME."
  (let ((class '((class color) (min-colors 89))))
    (custom-theme-set-faces
     theme
       `(line-number
         ((,class
           (:foreground ,(ewal-get-color 'comment 0)
            :background ,(ewal-get-color 'background 0))))
       `(page-break-lines
         ((,class
           (:foreground ,(ewal-get-color 'background -3)
            :background ,(ewal-get-color 'background -3)))))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'ewal-spacemacs-themes)

;;; ewal-spacemacs-themes.el ends here
