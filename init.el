(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(require 'use-package)

(use-package clj-refactor)
(use-package clojure-mode
  :mode (("\\.clj$" . clojure-mode)
	 ("\\.cljs$" . clojurescript-mode))
  ;; 2 space indenting
  :init (setq clojure-defun-style-default-indent t)
  :config (cljr-add-keybindings-with-prefix "C-c C-h"))

(use-package magit
  :bind ("C-c m" . magit-status))
(use-package auto-complete
  :init (global-auto-complete-mode))
(use-package yaml-mode
  :mode (("\\.yml$" . yaml-mode)))
(use-package projectile)
(use-package apache-mode
  :mode (("\\.htaccess\\'" . apache-mode)
	 ("httpd\\.conf\\'" . apache-mode)
	 ("sites-\\(available\\|enabled\\)/" . apache-mode)))
(use-package nginx-mode
  :mode (("nginx\\.conf$" . nginx-mode)))

(use-package anzu)
(global-anzu-mode)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%")  'anzu-query-replace-regexp)

(use-package swiper
  :config
  (progn
    (ivy-mode 1)
    (global-set-key (kbd "C-s") 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c x b") 'counsel-projectile-switch-to-buffer)

    ;; virtual buffers and layout saving
    (setq ivy-use-virtual-buffers t)
    (global-set-key (kbd "C-c v") 'ivy-push-view)
    (global-set-key (kbd "C-c V") 'ivy-pop-view)))

(use-package avy
  :config
  (progn
    (global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
    (global-set-key (kbd "s-w") 'ace-window)))

(setq tab-width 4)
(setq-default abbrev-mode t)

(define-key global-map (kbd "<f5>") 'revert-buffer)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "M-z") 'ace-jump-zap-up-to-char)

(add-hook 'clojure-mode-hook 'company-mode)
(add-hook 'cider-interaction-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'show-paren-mode)

(global-set-key [(control c) (\:)] 'uncomment-region)
