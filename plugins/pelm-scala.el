;;; pelm-scala.el --- PELM scala 
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(unless (require 'scala-mode nil t)
  (el-get-install "scala-mode"))


(require 'scala-mode-auto)

(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))

(add-hook 'scala-mode-hook
          '(lambda()
             (yas/minor-mode-on)
             (auto-complete-mode)
             ))

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)
             ))

(add-hook 'inferior-scala-mode
          '(lambda()
             (auto-complete-mode)
             ))

;;FIXME: ensime not working with el-get 
(add-to-list 'load-path (concat pelm-el-get-dir "ensime/dist_2.9.2/elisp"))
(require 'ensime)

;; This step causes the ensime-mode to be started whenever
;; ;; scala-mode is started for a buffer. You may have to customize this step
;; ;; if you're not using the standard scala mode.
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'pelm-scala)


;;; pelm-scala.el ends here
