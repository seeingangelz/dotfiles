;; ewal-spacemacs-modern-theme.el --- A modern, `ewal'-colored take on `spacemacs-theme'.

(require 'ewal-spacemacs-themes)
;; has to be run before loading `spacemacs-common'
(setq spacemacs-theme-org-highlight t)
(let ((spacemacs-theme-custom-colors
       (ewal-spacemacs-themes-get-colors)))
  (require 'spacemacs-common)
  (deftheme ewal-spacemacs-modern)
  ;; must be run before `create-spacemacs-theme'
  (ewal-spacemacs-themes--modernize-theme
   'ewal-spacemacs-modern)
  (create-spacemacs-theme
   'dark 'ewal-spacemacs-modern))

(provide-theme 'ewal-spacemacs-modern)
;; ewal-spacemacs-modern-theme.el ends here
