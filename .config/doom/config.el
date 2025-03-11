;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Thales Loreto"
      user-mail-address "tloreto.dev@gmail.com")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "GeistMono Nerd Font" :size 16))

(setq doom-theme 'catppuccin)
(setq doom-themes-enable-bold 'nil)
(setq doom-themes-enable-italic 'nil)
(setq fancy-splash-image "~/.config/doom/splash/emacs-dash.png")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Remove the top bar Emacs App and set Opacity
(add-to-list 'default-frame-alist '(undecorated-round . t))
;; (add-to-list 'default-frame-alist '(alpha . 96))

;; Start GO stuff
;; gofumpt >> gofmt
(after! go-mode
  (if (and (modulep! :lang go +lsp) (executable-find "gofumpt"))
      (setq lsp-go-use-gofumpt t)
    (mssage "gofumpt not installed")))

(use-package! dap-dlv-go)

;; (after! lsp-mode
;;   (setq lsp-go-use-gofumpt t)
;;   (setq lsp-go-analyses '((fieldalignment . t)
;;                           (nilness . t)
;;                           (shadow . t)
;;                           (unusedparams . t)
;;                           (useany . t)
;;                           (unusedvariable . t))))

;; Organize imports on save
(add-hook 'go-mode-hook #'lsp-deferred)
;; Make sure you don't have other goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; End GO stuff
;;
;; dap-mode keybinding
(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
