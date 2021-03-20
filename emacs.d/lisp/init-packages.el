;; =================== 插件管理 ======================
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ))
;;(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
;;			 ("melpa-stable" . "https://stable.melpa.org/packages/")
;;			 ("melpa" . "https://melpa.org/packages/")
;;                       ("marmalade" . "http://marmalade-repo.org/packages/")
;;			 ("org" . "http://orgmode.org/elpa/")
;;			 ))
(setq package-enable-at-startup nil)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(require 'cl)
;; Add Packages
(setq my/packages '(
		    popwin
		    ;; --- auto-completion ---
		    company
		    company-jedi
		    ;; --- better editor ---
		    evil
		    hungry-delete
		    ;; TODO
		    swiper
		    counsel
		    ;; TODO
		    smartparens
		    rainbow-delimiters
		    ;; --- Major Mode ---
		    js2-mode
		    ;; --- Minor Mode ---
		    nodejs-repl
		    exec-path-from-shell
		    ;; --- org ---
		    org-pomodoro
		    ;; TODO orca
		    ;; --- Productivity ------
		    helm
		    yasnippet
		    yasnippet-snippets
		    anki-editor
		    ;; --- Themes ---
		    spacemacs-theme
		    monokai-theme
		    ;; solarized-theme
		    ))
(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; TODO Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'popwin)
(popwin-mode 1)

(require 'evil)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(require 'hungry-delete)
(global-hungry-delete-mode)
;; TODO
(setq hungry-delete-join-reluctantly t)
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; jedi 配置
;;(setq jedi:server-command (jedi:-env-server-command))
;;(setq company-tooltip-align-annotations t)

(defun config/enable-jedi ()
  (setq jedi:environment-root "deployment")
  (add-to-list 'company-backends 'company-jedi)
  (setq jedi:get-in-function-call-delay 0)
  (setq jedi:complete-on-dot t)
  (setq compandy-minimum-prefix-length 3)
  (setq jedi:use-shortcuts t) ;; 补全的时候识别简写
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))
  )
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'config/enable-jedi)
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet-snippets-20210105.1346/snippets"
	"~/.emacs.d/snippets/"
	))
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; anki
(setq anki-editor-create-decks t)

(load-theme 'spacemacs-light t)
(provide 'init-packages)
