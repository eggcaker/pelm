;;; pelm-keys.el --- PELM global shortkeys 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs


(evil-leader/set-key
  ;; common keys
  "e" 'find-file
  "s" 'save-buffer
  "f" 'projectile-find-file
  "b" 'ido-switch-buffer
  "k" 'kill-buffer-no-question
  "w" 'evil-window-map
;  "p" 'projectile-keymap-prefix 
)


(global-set-key  "\M-n" 'scroll-up-command)
(global-set-key  "\M-p" 'scroll-down-command)

(define-key evil-normal-state-map ";" 'evil-window-map)
(define-key evil-normal-state-map ":" 'evil-ex)

(define-key evil-window-map "v" 'split-window-vertically)
(define-key evil-window-map "s" 'split-window-horizontally)
(define-key evil-window-map "0" 'delete-window)
(define-key evil-window-map "1" 'delete-other-windows)
(define-key evil-window-map "2" 'split-window-below)
(define-key evil-window-map "3" 'split-window-right)
(define-key evil-window-map "4" 'ctl-x-4-prefix)
(define-key evil-window-map "5" 'ctl-x-5-prefix)



;; projectile 
(provide 'pelm-keys)
;;; pelm-keys.el ends here
