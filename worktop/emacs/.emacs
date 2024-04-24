;; Set the packages repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(setq package-install-upgrade-built-in t)


;; Set home directory
(setq initial-buffer-choice "~/Documents/org/home.org")

;; Set eshell variables and preferences
(setq eshell-prefer-lisp-functions t)
(setq eshell-prefer-lisp-variables t)
(setq eshell-prefer-lisp-variables t)
(setq eshell-cmpl-cycle-completions nil)

;; sets sudo to remember that I can sudo
(require 'em-tramp)
(setq password-cache t)
(setq password-cache-expiry 120)

;; Change all yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Prompt for y/n before quitting
(setq confirm-kill-emacs 'y-or-n-p)

;; Basic UI configurations
;; Remove default welcome to Emacs screen
(setq inhibit-startup-message t
      initial-scratch-message nil)

;; Remove useless bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Numbers in most buffers
(global-linum-mode t)
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      erc-mode
                                      jabber-roster-mode
                                      jabber-chat-mode
                                      gnus-group-mode
                                      gnus-summary-mode
                                      gnus-article-mode
                                      dired-mode))

;;(defadvice linum-on (around linum-on-inhibit-for-modes)
  ;;"Stop the load of linum-mode for some major modes."
    ;;(unless (member major-mode linum-mode-inhibit-modes-list)
      ;;ad-do-it))

;;(ad-activate 'linum-on)


;; Programming options
;; remove useless spaces before and after
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; Latex
;;(add-hook 'LaTeX-mode-hook #'latex-extra-mode)
(setq latex-run-command "pdflatex")
(setq tex-dvi-view-command "(f=*; pdflatex \"${f%.dvi}.tex\" && open \"${f%.dvi}.pdf\")")

;; C/CPP
;; Setting proper tab width
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "k&r")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Web files (PHP, Vue, TSX, JS
;; Adding my common web filetypes to web-mode
;; TODO FIX
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Org stuff
(require 'emacsql-sqlite)
(require 'org-tempo)
(require 'org-superstar)

;; Org directories
(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/agenda.org"))
(setq org-roam-directory (file-truename "~/Documents/org/"))

(setq org-roam-capture-templates
      `(("d" "default" plain "%?"
        :target (file+head "${slug}.org"
                           "#+title: ${title}\n#+author: emp\n\n* overview")
        :unnarrowed t)))
(setq org-log-done 'time)
(setq org-return-follows-link t)
(org-roam-db-autosync-mode)


;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)
;; Set default browser to be eww
(setq browse-url-browser-function 'eww)


;; Various graphics only
;; Setting the font style
(setq default-frame-alist '((font . "Iosevka SS09")))
(set-face-attribute 'default t :font "Iosevka SS09")
(set-face-attribute 'default nil :font "Iosevka SS09" )
(set-face-attribute 'default nil :height 135)

;; adding dark mode
(load-theme 'leuven-dark t)

;; Hover with mouse to select buffer
(setq mouse-autoselect-window t)

;; Adding fullscreen
;; Start maximised (cross-platform)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(dired-listing-switches "-laBGh")
 '(package-selected-packages
   '(seq web-mode latex-extra monkeytype emacsql-sqlite org-superstar magit org-roam leuven-theme))
 '(warning-suppress-log-types '((auto-save))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; enable some spicy commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
