(require 'package)
(require 'emacsql-sqlite)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)

;; Set home directory
(setq initial-buffer-choice "~/Documents/org/home.org")

;; Basic UI configurations
;; Remove useless bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; Numbers in progam mode
;;(global-display-line-numbers-mode 1)
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

(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
    (unless (member major-mode linum-mode-inhibit-modes-list)
      ad-do-it))


(ad-activate 'linum-on)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; remove useless spaces
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
;; Adding fullscreen
;; Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)


(setq inhibit-startup-message t
      initial-scratch-message nil)

;; Setting proper tab width
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-default-style "k&r")
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; adding dark mode
(load-theme 'leuven-dark t)

;; Change all yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Prompt for y/n before quitting
(setq confirm-kill-emacs 'y-or-n-p)

;; Adding my common web filetypes to web-mode
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Setting the font style
(setq default-frame-alist '((font . "Iosevka SS09")))
(set-face-attribute 'default t :font "Iosevka SS09")
(set-face-attribute 'default nil :font "Iosevka SS09" )
(set-face-attribute 'default nil :height 135)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Org stuff
(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/agenda.org"))
(setq org-log-done 'time)
(require 'org-tempo)
(require 'org-superstar)
(setq org-roam-directory (file-truename "~/Documents/org/"))
(setq org-roam-capture-templates
      `(("d" "default" plain "%?"
        :target (file+head "${slug}.org"
                           "#+title: ${title}\n#+author: emp\n\n* overview")
        :unnarrowed t))
    )
(org-roam-db-autosync-mode)
(setq org-return-follows-link  t)



;;(add-hook 'LaTeX-mode-hook #'latex-extra-mode)
(setq latex-run-command "pdflatex")
(setq tex-dvi-view-command "(f=*; pdflatex \"${f%.dvi}.tex\" && open \"${f%.dvi}.pdf\")")

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)
(setq mouse-autoselect-window t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(dired-listing-switches "-laBGh")
 '(package-selected-packages
    '(web-mode latex-extra monkeytype emacsql-sqlite org-superstar magit org-roam leuven-theme))
 '(warning-suppress-log-types '((auto-save))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
