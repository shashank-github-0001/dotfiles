;; this is cursom emacs file
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0" "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4" default))
 '(display-line-numbers 'relative)
 '(evil-undo-system 'undo-redo)
 '(global-display-line-numbers-mode t)
 '(ido-use-virtual-buffers 'auto)
 '(package-selected-packages '(ido-completing-read+ evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; this is the normal shit
(tool-bar-mode -1)
(server-start)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(show-paren-mode 1)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(set-fringe-mode 10)
(setq visual-bell t)
(column-number-mode t)
(set-face-attribute 'default nil :family "Iosevka Nerd Font Mono" :height 140)

;; starting to set keybindings now
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
(windmove-default-keybindings)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key dired-mode-map "c" 'find-file)

;; for backup and autosaving
(setq backup-directory-alist `((".*" . "~/.emacs.d/backups")))
(setq backup-by-copying t) ;; Avoid file renaming for backups
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/autosaves/" t)))

;; disable lockfiles
(setq create-lockfiles nil)

;; configuring melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings nil)
  :config
  (evil-mode 1))

;; ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(ido-ubiquitous-mode 1)

;; undo tree

;; (use-package undo-tree 
;;   :ensure t
;;   :config
;;   (global-undo-tree-mode 1))

;; tab mode
(setq-default tab-width 4
         indent-tabs-mode nil)


