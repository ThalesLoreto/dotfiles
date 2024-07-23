;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Vim tutor inside emacs =]
(package! evil-tutor)
;; Best theme ever
(package! catppuccin-theme)
;; AI
(package! gptel)
;; code buddy
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))
