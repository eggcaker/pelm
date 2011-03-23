;;yasnippet module
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/modules/yasnippet/snippets")
(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))
(yas/reload-all)

(add-hook 'jabber-chat-mode-hook 'yas/minor-mode)
(add-hook 'android-mode-hook
      '(lambda ()
              (setq yas/mode-symbol 'android-mode))
      )
