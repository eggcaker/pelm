;; PELM's init.el
;; Author: caker
;; Last modified: 2011-12-04
;; Version: 0.5.0

(add-to-list 'load-path "~/.emacs.d")

(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(defvar pelm-personal-dir (concat pelm-dir "personal/")
  "Users of PELM are encouraged to keep their personal configuration
   changes in this directory. All Emacs Lisp files there are loaded
   automatically by PELM.")

(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
(add-to-list 'load-path pelm-personal-dir)

;; the PELM have pre-init.el and post-init.el which you can do your own code
;; pre-init.el load at begin, for example: if you using emacs < 24,you
;; can require org-mode here by :
;; (require 'org)  or you can load it from pre-init-private.org, see below
(load-file "~/.emacs.d/pre-init.el")

;; load the pre-init-private.org file if it exists
;; this file is under .gitignore,
;; so it' wont' be version-controlled. The idea is to make
;; this file load other version-controlled or private stuff
;; before the pelm load.
(if (file-exists-p "~/.emacs.d/pre-init-private.org")
    (org-babel-load-file "~/.emacs.d/pre-init-local.org"))

;; load plugins 
(require 'pelm-runtime)
(require 'pelm-editor)
(require 'pelm-ui)
(require 'pelm-editor)
(require 'pelm-keys)
(require 'pelm-shell)
(require 'pelm-server)
(require 'pelm-ac)
(require 'pelm-android)
(require 'pelm-git)
(require 'pelm-yas)

;; load mode
(require 'pelm-c)
(require 'pelm-yml)
(require 'pelm-markdown)
(require 'pelm-scss)
(require 'pelm-scala)



;; load the personal settings 
(when (file-exists-p pelm-personal-dir)
  (mapc 'load (directory-files pelm-personal-dir nil "^[^#].*el$")))

;; You're expected to populate .emacs.d/post-init-local.org
;; with your own code after the PELM loaded(kind of overide ?).
;; This file is under .gitignore
;; so it won't be version-controlled. The idea is to
;; make this file load other version-controlled files.

(if (file-exists-p "~/.emacs.d/post-init-local.org")
    (org-babel-load-file "~/.emacs.d/post-init-local.org"))

(package-manager-show-load-time)

;;; ends init.el here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/Library/android-sdk-mac_x86")
 '(column-number-mode t)
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes (quote (("left1" (0.3 . 0.3) (0.15 . 0.35) (0.15 . 0.35) (0.3 . 0.35)))))
 '(git-baseline-alist (quote (("/Users/eggcaker/src/Android/DIT/" . "origin/sync-1.0"))) t)
 '(inhibit-startup-screen t)
 '(jabber-alert-message-hooks (quote (jabber-message-awesome jabber-message-echo jabber-message-scroll)))
 '(jabber-alert-presence-hooks (quote (jabber-presence-awesome jabber-presence-echo)))
 '(jabber-avatar-verbose nil)
 '(jabber-roster-show-bindings nil)
 '(jabber-roster-show-title nil)
 '(jabber-show-offline-contacts nil)
 '(jabber-show-resources nil)
 '(jabber-vcard-avatars-publish nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(joc-eshell-prompt-newline t)
 '(scroll-bar-width nil t)
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
