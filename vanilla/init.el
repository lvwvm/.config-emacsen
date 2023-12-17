;;; init.el --- Personal Customization
;; Copyright (C) 2019 Idigo Luwum

;; Author: Idigo Luwum <luwum@void.host>
;; Maintainer: Idigo Luwum <luwum@void.host>
;; Created:
;; Keywords: .emacs, init, personalization, customization
;; Homepage: http://github.com/lvwvm/emacs.d

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;;  This program is distributed in the hope that it will be useful,
;;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;  GNU General Public License for more details.

;;  You should have received a copy of the GNU General Public License
;;  along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(defun check-default-byte-compile ()
  "Check whether a default bytecompile")

(defun list-load-files ()
  "Load files needed for ")

(eval-when-compile
  (set-language-environment "UTF-8")

  ;; testing for idioms
  (set-variable var1 1)
  (setq var2 2)		      
  (setq-default var3 3)
  
  ;; TODO check when undefined
  (setq-default user-init-file
       (getenv "$EMACSINIT"
                         (expand-file-name "~/.config/emacs/init.el")

                         ;; EMACS DATA LOCATED IN XDG_DATA_HOME
                         ;; TODO CHECK WHEN UNDEFINED
                         (setq-default user-emacs-directory
                                       (getenv "$EMACSHOME"
                                                (file-name-as-directory
                                                 (expand-file-name "~/.local/share/emacs"))))

                         ;; MAKE RELATIVE LINE NUMBERS
                         (when (version<= "26.0.50" emacs-version)
                           (setq-default display-line-numbers-type 'relative)
                           (global-display-line-numbers-mode))

                         ;; USEPACKGE INSTALLS VIA STRAIGHT BY DEFAULT
                         (setq-default straight-use-package-by-default t)

                         ;; BEGIN STRAIGHT BOOTSTRAP INSTALLATION
                         (defvar bootstrap-version)
                         (let ((bootstrap-file
                                (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
                               (bootstrap-version 5))
                           (unless (file-exists-p bootstrap-file)
                             (with-current-buffer
                                 (url-retrieve-synchronously
                                  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                                  'silent 'inhibit-cookies)
                               (goto-char (point-max))
                               (eval-print-last-sexp)))
                           (load bootstrap-file nil 'nomessage)))
            (straight-use-package 'use-package)
            ;;END STRAIGHT BOOTSTRAP INSTALLATION

                ;; REMOVE TOOL BAR, SCROLL BAR, AND MENU BAR.
                (use-package tool-bar
                  :straight (:type built-in)
                  :config (tool-bar-mode 0))
                (use-package menu-bar
                  :straight (:type built-in)
                  :config (menu-bar-mode 0))
                (use-package scroll-bar
                  :straight (:type built-in)
                  :config (scroll-bar-mode 0))

                ;; PACKAGE MANAGER UI ENHANCEMENT
                (use-package paradox
                  :config (paradox-enable))

                ;; EMACS THEMES
                (use-package base16-theme
                  :config (load-theme 'base16-phd t))

                ;; ICONS
                ;;TODO - ADD POSTINSTALL HOOK
                (use-package all-the-icons)

                ;; EVIL VI EMULATION
                (use-package evil
                  :config (evil-mode 1))

                ;; IVY -
                (use-package ivy
                  :config (ivy-mode 1))

                ;; COMPANY
                (use-package company
                  :init (setq-default company-idle-delay .5)
                  :config (company-mode))


                (custom-set-variables
                 ;; custom-set-variables was added by Custom.
                 ;; If you edit it by hand, you could mess it up, so be careful.
                 ;; Your init file should contain only one such instance.
                 ;; If there is more than one, they won't work right.

                 '(custom-safe-themes
                   (quote
                    ("ffe80c88e3129b2cddadaaf78263a7f896d833a77c96349052ad5b7753c0c5a5" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" default)))
                 '(package-selected-packages
                   (quote
                    (helm-company helm-rtags helm-system-packages helm-systemd helm-themes helm-tnramp helm-xref helpful highlight-indent-guides hledger-mode hydra irony irony-eldoc json-mode libgit lsp-haskell lsp-java lsp-pyre magit-filenotify magit-gh-pulls magit-libgit magit-org-todos nasm-mode nginx-mode npm-mode ob-async ob-http ob-ipython ob-rust ob-typescript ob-uart olivetti org-alert org-analyzer org-autolist org-caldav org-cliplink org-gcal org-gnome org-journal org-mind-map org-mru-clock org-trello org2issue org2web page-break-lines passmm persp-fr persp-mode persp-mode-projectile-bridge persp-projectile perspective pip-requirements poetry pomidor pony-mode projectile-direnv projectile-git-autofetch projectile-ripgrep projectile-speedbar pt pug-mode pyenv-mode pyenv-mode-auto python-mode racer reason-mode relative-buffers restclient restclient-helm rg rust-mode sass-mode sauron sclang-extensions sclang-snippets scss-mode slime slime-company ssh ssh-agency swiper swiper-helm systemd terraform-doc terraform-mode tide toml-mode treemacs treemacs-evil treemacs-icons-dired treemacs-magit treemacs-projectile tuareg typescript-mode use-package use-package-chords use-package-el-get use-package-ensure-system-package use-package-hydra utop vhdl-capf vhdl-tools vimrc-mode virtualenvwrapper visual-regexp visual-regexp-steroids vue-html-mode vue-mode vyper-mode web-server websocket which-key writegood-mode x509-mode x86-lookup xterm-color yaml-mode yasnippet yasnippet-snippets zig-mode company flycheck-ats2 flycheck-clang-analyzer flycheck-clang-tidy flycheck-package flycheck-pkg-config flycheck-pyflakes flycheck-pyre flycheck-rtags helm-org-rifle lsp-ui major-mode-hydra major-mode-icons ob-prolog org-brain org-evil org-page org-pomodoro org-present org-projectile org-projectile-helm org-ref package+ package-lint pass password-store password-store-otp path-helper python-black digitalocean digitalocean-helm evil evil-leader flycheck-ocaml flycheck-rust helm-lsp helm-org helm-pass helm-projectile helm-pt helm-spotify helm-spotify-plus lsp-mode magit magit-diff-flycheck merlin merlin-eldoc neotree nvm opam orca org-ac paradox helm-fd helm-flycheck)))
                 '(paradox-github-token t))
                (custom-set-faces
                 ;; custom-set-faces was added by Custom.
                 ;; If you edit it by hand, you could mess it up, so be careful.
                 ;; Your init file should contain only one such instance.
                 ;; If there is more than one, they won't work right.
                 '(default ((t (:family "FuraMono Nerd Font Mono" :foundry "CTDB" :slant normal :weight normal :height 136 :width normal)))))

                (provide 'init)

;;; init.el ends here
