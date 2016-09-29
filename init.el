;; My New Emacs settings


; Package manager
(require 'package)


;; package.el
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(package-refresh-contents)

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Keymap
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; Language - Japanese
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; Cursor
(set-cursor-color "Black")
(blink-cursor-mode 1)

;; Scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; Startup
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(global-linum-mode t)
(show-paren-mode 0)

;; Tab
(setq default-tab-width 4)

;; Dired
(add-hook 'dired-mode-hook
          (lambda ()
            (load "dired-x")
            (setq dired-omit-files-p t)
	    (dired-hide-details-mode)))

;; Font - フォントの設定、とても大事。
;; http://d.hatena.ne.jp/setoryohei/20110117/1295336454
(let* ((fontset-name "myfonts") ; フォントセットの名前
       (size 12) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
       (asciifont "Menlo") ; ASCIIフォント
       (jpfont "Hiragino Kaku Gothic ProN") ; 日本語フォント
       (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)) 
       (fsn (create-fontset-from-ascii-font font nil fontset-name)))
  (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
  (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
  (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
  )
 
;;; デフォルトのフレームパラメータでフォントセットを指定
(add-to-list 'default-frame-alist '(font . "fontset-myfonts"))
 
;;; フォントサイズの比を設定
(dolist (elt '(("^-apple-hiragino.*" . 1.2)
	       (".*osaka-bold.*" . 1.2)
	       (".*osaka-medium.*" . 1.2)
	       (".*courier-bold-.*-mac-roman" . 1.0)
	       (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	       (".*monaco-bold-.*-mac-roman" . 0.9)))
  (add-to-list 'face-font-rescale-alist elt))
 
;;; デフォルトフェイスにフォントセットを設定
;;; (これは起動時に default-frame-alist に従ったフレームが作成されない現象への対処)
(set-face-font 'default "fontset-myfonts")

;; PATH
(use-package exec-path-from-shell
  :init	 (exec-path-from-shell-initialize)
  :ensure t)

;;; Rainbow
(use-package rainbow-delimiters
  :ensure t)

;; avy, jump to something
(use-package avy
  :demand
  :ensure t
  :commands (avy-goto-char
			 avy-goto-line)
  :config
  (progn
	(custom-set-variables
	 '(avy-background t)
	 '(avy-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n ?s))))
  :bind (("C-." . avy-goto-char)
		 ("C-," . avy-goto-line)))
  
;; markdown
(use-package markdown-mode
  :ensure t
  :config
  (custom-set-variables
   '(markdown-command "pandoc -f markdown -t html")))
   
;; Company
(use-package company
  :ensure t
  :config
  (progn
	(setq company-idle-delay 0.1)
	(setq company-minimum-prefix-length 2)
	(setq company-selection-wrap-around t)))

;; company for haskell
(use-package company-ghc
  :ensure t
  :config
  (progn
	(add-to-list 'company-backends 'company-ghc)
	(custom-set-variables '(company-ghc-show-info t))))

(use-package hindent
  :ensure t)

;; Haskell
(use-package haskell-mode
  :ensure t
  :config
  (progn
	(add-hook 'haskell-mode-hook 'company-mode)
	(add-hook 'haskell-mode-hook #'hindent-mode)
	(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)
	(add-to-list 'completion-ignored-extensions ".hi")

	(custom-set-variables
	 '(haskell-process-path-ghci "/usr/local/bin/ghci")
	 '(haskell-process-type (quote cabal-repl))
	 '(haskell-stylish-on-save t)
	 '(haskell-tags-on-save t))

	(define-key haskell-mode-map (kbd "C-x C-d") nil)
	(define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
	(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
	(define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
	(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
	(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
	(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
	(define-key haskell-mode-map (kbd "C-c M-.") nil)
	(define-key haskell-mode-map (kbd "C-c C-d") nil)
	(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
	(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)
	(define-key haskell-mode-map (kbd "C-c h") 'haskell-hoogle)))

;(eval-after-load 'haskell-cabal
 ; '(progn
  ;   (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)     ))


;; Proof-General
; (load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")



;; Scheme
(add-to-list 'process-coding-system-alist
	     '("gosh" utf-8 . utf-8))
(setq scheme-program-name "/usr/local/bin/gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(put 'match 'scheme-indent-function 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)


;; Ruby
;(require 'ruby-electric)
;(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;(setq ruby-electric-expand-delimiters-list nil)

;(require 'ruby-block)
;(ruby-block-mode t)
;(setq ruby-block-highlight-toggle t)

;(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
;(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;(require 'flycheck)
;(setq flycheck-check-syntax-automatically '(mode-enabled save))
;(add-hook 'ruby-mode-hook 'flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-background t)
 '(avy-keys (quote (97 111 101 117 105 100 104 116 110 115)))
 '(company-ghc-show-info t)
 '(haskell-process-path-ghci "/usr/local/bin/ghci")
 '(haskell-process-type (quote cabal-repl))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(markdown-command "pandoc -f markdown -t html")
 '(package-selected-packages
   (quote
	(yatex use-package rust-mode rainbow-delimiters markdown-mode hindent hi2 exec-path-from-shell company-ghc avy))))
