;; ewal-spacemacs-classic-theme.el --- A classic, `ewal'-colored take on `spacemacs-theme'.

(require 'ewal-spacemacs-themes)
;; has to be run before loading spacemacs-common
(let ((spacemacs-theme-custom-colors
       (ewal-spacemacs-themes-get-colors t)))
  (require 'spacemacs-common)
  (deftheme ewal-spacemacs-classic)
  (create-spacemacs-theme 'dark 'ewal-spacemacs-classic))

(provide-theme 'ewal-spacemacs-classic)
;; ewal-spacemacs-classic-theme.el ends here
