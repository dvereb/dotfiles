(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blank-chars
   (quote
	(tabs spaces trailing lines space-before-tab indentation empty space-after-tab)))
 '(c-basic-offset 4)
 '(c-default-style
   (quote
	((c-mode . "linux")
	 (c++-mode . "linux")
	 (java-mode . "java")
	 (awk-mode . "awk")
	 (other . "linux"))))
 '(custom-safe-themes
   (quote
	("3ed645b3c08080a43a2a15e5768b893c27f6a02ca3282576e3bc09f3d9fa3aaa" default)))
 '(mouse-wheel-progressive-speed nil)
 '(package-selected-packages
   (quote
	(keyfreq atom-dark-theme blank-mode color-theme fill-column-indicator)))
 '(standard-indent 4))
'(c-offsets-alist . ((innamespace . [0])))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blank-indentation ((t (:background "grey18" :foreground "aquamarine4"))))
 '(blank-space ((t (:background "grey18" :foreground "aquamarine4"))))
 '(blank-space-after-tab ((t (:background "grey18" :foreground "aquamarine4")))))

;; set .h to be c++-mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; set javascript and jsp to be web-mode:
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jspf\\'" . web-mode))

;; no indent in namespaces
(c-set-offset 'innamespace 0)

;; TAB SIZE:
(setq default-tab-width 4)

;; blank-mode (i.e. show tabs and spaces)
(require 'blank-mode)
  (add-hook 'c-mode-hook 'blank-mode)
  (add-hook 'c++-mode-hook 'blank-mode)
  (add-hook 'java-mode-hook 'blank-mode)
  (add-hook 'web-mode-hook 'blank-mode)
  (setq blank-line-column 100)

;; 100 char column limit
;; NOTE(dev): YOU SHOULD SET IT BELOW, AS WELL...or be a real man and use variable names.
(require 'fill-column-indicator)
  (setq-default fill-column 100)
  (add-hook 'c-mode-hook 'fci-mode)
  (add-hook 'c++-mode-hook 'fci-mode)
  (add-hook 'java-mode-hook 'fci-mode)
  (add-hook 'web-mode-hook 'fci-mode)

;; Bugfix for web-mode & fci-mode conflict
;; fci-mode MUST INITIALIZE AFTER web-mode for it to be run last in 'after-change-functions.
;; https://github.com/alpaker/Fill-Column-Indicator/issues/46
;; https://github.com/fxbois/web-mode/issues/242
  (add-hook 'after-change-major-mode-hook
            (lambda () (if (string= major-mode "web-mode")
						   (turn-off-fci-mode) (turn-on-fci-mode))))

;; smart-tabs-mode
(require 'smart-tabs-mode)
(smart-tabs-insinuate 'c 'c++ 'java 'javascript)

;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Remove Menu Bar (File, Edit...)
(menu-bar-mode -1)
;; Remove Tool Bar (Icons)
(tool-bar-mode -1)

(defun toggle-full-screen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(defun toggle-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode)
  (tool-bar-mode)
  (scroll-bar-mode))

(defun toggle-full-screen-and-bars ()
  "Toggles full-screen mode and bars."
  (interactive)
  (toggle-bars)
  (toggle-full-screen))

;; Use F11 to switch between windowed and full-screen modes
;;(global-set-key [f11] 'toggle-full-screen-and-bars)

;; Switch to full-screen mode during startup
;;(toggle-full-screen-and-bars)

;; Semantic for auto-complete
;;(semantic-mode 1)
;;(defun my:add-semantic-to-autocomplete()
;;  (add-to-list 'ac-sources 'ac-source-semantic)
;;)
;;(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;;(color-theme-initialize)
;;(color-theme-classic)
(load-theme 'atom-dark t)

;; No space after comments
(setq comment-start '"//")

;; disable toolbar & scrollbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)

;; TEST:
(setq font-lock-maximum-decoration '2)

;; Show which function you're in
;;(which-function-mode 1)
;; TODO(dev): Turn this back on when you figure out how to change the color

;; NOTE(dev): This doesn't work well:
;; Add clang-format options
;;(require 'clang-format)
;;(global-set-key [C-tab] 'clang-format-region)
