;;; setup-spell.el -*- lexical-binding: t; -*-
;; Time-stamp: <2020-05-28 16:36:02 csraghunandan>

;; Copyright (C) 2016-2020 Chakravarthy Raghunandan
;; Author: Chakravarthy Raghunandan <rnraghunandan@gmail.com>

;; flypsell: on the fly spell checking
(use-package flyspell
  :defer 2
  :straight nil
  :hook
  ((org-mode . flyspell-mode)
   (markdown-mode . flyspell-mode)
   (prog-mode . flyspell-prog-mode))
  :config

  ;; Save a new word to personal dictionary without asking
  (setq ispell-silently-savep t)

  ;; speed up flyspell
  (setq flyspell-issue-message-flag nil)

  ;; use hunspell as the default dictionary
  (when (executable-find "hunspell")
    (setq ispell-program-name (executable-find "hunspell"))
    (setq ispell-dictionary "british")
    (setq ispell-really-hunspell t)))

(provide 'setup-spell)

;; to install and configure hunspell on MacOS:
;; brew install hunspell or sudo apt install hunspell
;; cd ~/Library/Spelling/
;; wget http://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_GB.aff
;; wget http://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_GB.dic
;;
;; for ArchLinux, do the following to install hunspell along with is dictionaries
;; sudo pacman -S hunspell
;; sudo pacman -S hunspell-en_US hunspell-en_GB
