(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

;;Don't forget to run
;; M-x package-refresh-contents
;; M-x package-install RET use-package RET

(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ;;FRANK: put your org mode files here
    ("/mnt/c/Users/Frank/Google Drive/_environment_stuff/org_mode/main.org")))
 '(package-selected-packages
   (quote
    (evil-org evil-surround ## company-quickhelp company cider evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(progn
  (unless (fboundp 'helm-mode)
    (ido-mode t)
    (setq ido-enable-flex-matching t))

  (unless (eq window-system 'ns)
    (menu-bar-mode -1))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))

  (autoload 'zap-up-to-char "misc"
    "Kill up to, but not including ARGth occurrence of CHAR." t)

  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)

  (require 'saveplace)
  (setq-default save-place t)

  (global-set-key (kbd "M-/") 'hippie-expand)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (global-set-key (kbd "M-z") 'zap-up-to-char)

  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)
  (global-set-key (kbd "C-M-s") 'isearch-forward)
  (global-set-key (kbd "C-M-r") 'isearch-backward)

  (show-paren-mode 1)
  (setq-default indent-tabs-mode nil)
  (setq save-interprogram-paste-before-kill t
        apropos-do-all t
        mouse-yank-at-point t
        require-final-newline t
        visible-bell t
        load-prefer-newer t
        ediff-window-setup-function 'ediff-setup-windows-plain
        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))
(unless (package-installed-p 'company)
      (package-install 'company)) 

(unless (package-installed-p 'cider)
       (package-install 'cider)) 

(unless (package-installed-p 'evil)
       (package-install 'evil)) 

(require 'evil-surround)

(require 'evil)
(evil-mode 1)

(global-evil-surround-mode 1)


(global-company-mode)
;;(add-hook 'cider-repl-mode-hook #'company-mode)
;;(add-hook 'cider-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

(electric-pair-mode t)

;;TODO: make this trigger and only activate during cider repl mode
(define-key evil-normal-state-map  (kbd "M-.") #'cider-find-var)
(define-key evil-normal-state-map  (kbd "M-e") #'cider-eval-defun-at-point)

(use-package evil-org
             :ensure t
             :after org
             :config
             (add-hook 'org-mode-hook 'evil-org-mode)
             (add-hook 'evil-org-mode-hook
                       (lambda ()
                         (evil-org-set-key-theme)))
             (require 'evil-org-agenda)
             (evil-org-agenda-set-keys))
(global-set-key "\C-ca" 'org-agenda)
