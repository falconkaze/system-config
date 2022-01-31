(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; 快捷打开配置文件
;; TODO 新建一个窗口打开，而不是切换到另一个窗口，交互式；自动关闭
(defun open-init-file(file)
  (interactive)
  (find-file (format "~/.emacs.d/%s" file)))

;; https://stackoverflow.com/questions/1250846/wrong-type-argument-commandp-error-when-binding-a-lambda-to-a-key
(global-set-key (kbd "<f2> i") '(lambda () (interactive) (open-init-file "init.el")))
(global-set-key (kbd "<f2> p") '(lambda () (interactive) (open-init-file "lisp/init-packages.el")))
(global-set-key (kbd "<f2> o") '(lambda () (interactive) (open-init-file "lisp/init-org.el")))
(global-set-key (kbd "<f2> k") '(lambda () (interactive) (open-init-file "lisp/init-keybindings.el")))
(global-set-key (kbd "<f2> k") '(lambda () (interactive) (open-init-file "lisp/init-keybindings.el")))

;; helm 快捷键
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; org 快捷键
(global-set-key (kbd "C-c l") 'org-store-link)

;; TODO 根据书签的标题来过滤
 (provide 'init-keybindings)
