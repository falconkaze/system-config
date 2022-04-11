;; org mode 下自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;; 设置 org 文件默认的折叠方式
(setq org-startup-folded 'content)
;(setq org-todo-keywords '((sequence "TODO" "DOING" "DONE")))
;(setq org-todo-keyword-faces '(("TODO" . "red")
;                               ("DOING" . "yellow")
;                               ("DONE" . "green")))
;; (setq org-src-fontify-natively t)
;; 设置默认的 Org Agenda 目录
(setq org-agenda-files '("~/org/common"
			 "~/org/private"))
(global-set-key (kbd "C-c a") 'org-agenda) ;; 设置 org-agenda 打开的快捷键
(setq org-use-fast-todo-selection t)
;; (setq org-treat-S-cursor-todo-selection-as-state-change nil)

;;(server-start)
(require 'org-protocol)

;; ================================任务快速归档=================================
;; 任务完成后，自动归档
(defun my/auto-archive-task (change-plist)
  (let ((type (plist-get change-plist :type))
	(pos (plist-get change-plist :position))
	(from (plist-get change-plist :from))
	(to (plist-get change-plist :to))
	)
    (message "type:%s, pos:%s, from:%s, to:%s" type pos from to)
    (when (or (and (string= from nil)
	       (string= to "TODO"))
	      (string= to "ARCHIVED"))
      (let ((answer (read-char (format "Archive this %s task? y/n (y)" to))))
	(when (= answer (string-to-char "y"))
	    (org-archive-subtree)
      )))))
(setq org-archive-location "archived/a_%s::datetree/")
(add-hook 'org-trigger-hook 'my/auto-archive-task)
;; 归档后保存所有文件
(defun my/save-auto-archive-file ()
  (interactive)
  (save-some-buffers 'no-confirm))
(advice-add 'org-archive-subtree :after #'my/save-auto-archive-file)

;; org-capture 配置
(defun get-year-and-month ()
  (list (format-time-string "%Y年") (format-time-string "%m月")))
(defun find-month-tree ()
  (let* ((path (get-year-and-month))
         (level 1)
         end)
    (unless (derived-mode-p 'org-mode)
      (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
    (goto-char (point-min))             ;移动到 buffer 的开始位置
    ;; 先定位表示年份的 headline，再定位表示月份的 headline
    (dolist (heading path)
      (let ((re (format org-complex-heading-regexp-format
                        (regexp-quote heading)))
            (cnt 0))
        (if (re-search-forward re end t)
            (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
          (progn                        ;否则就新建一个 headline
            (or (bolp) (insert "\n"))
            (if (/= (point) (point-min)) (org-end-of-subtree t t))
            (insert (make-string level ?*) " " heading "\n"))))
      (setq level (1+ level))
      (setq end (save-excursion (org-end-of-subtree t t))))
    (org-end-of-subtree)))

(defun get-work-tree()
  (list "Work" "Task" (format-time-string "%Y年") (format-time-string "%Y年%W周")))
(defun find-tree-location (tree-list)
  (let* ((path tree-list)
         (level 1)
	 my/target-tree-not-exist
         end)
    (unless (derived-mode-p 'org-mode)
      (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
    (goto-char (point-min))             ;移动到 buffer 的开始位置
    ;; 先定位表示年份的 headline，再定位表示月份的 headline
    (dolist (heading path)
      (let ((re (format org-complex-heading-regexp-format
                        (regexp-quote heading)))
            (cnt 0))
        (if (re-search-forward re end t)
            (goto-char (point-at-eol))  ;如果找到了 headline 就移动到对应的位置
          (progn                        ;否则就新建一个 headline
            (or (bolp) (insert "\n"))
            (if (/= (point) (point-min)) (org-end-of-subtree t t))
	    (setq my/target-tree-not-exist t)
            (insert (make-string level ?*) " " heading "\n"))))
      (setq level (1+ level))
      (setq end (save-excursion (org-end-of-subtree t t))))
    (when (not(null my/target-tree-not-exist))
        (message "aa hello")
	(org-end-of-subtree))))

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/org/common/inbox.org")
(setq org-capture-templates nil)
;; task 相关
(add-to-list 'org-capture-templates '("t" "Tasks"))
(add-to-list 'org-capture-templates
	     '("tr" "Read Book Task" entry
	       (file+olp "~/org/common/task.org" "Tasks" "Reading" "Book")
	       "* %^{书名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("tt" "Tool Task" entry
	       (file+olp "~/org/common/task.org" "Tasks" "Tool")
	       "* %^{任务名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("ts" "Study Task" entry
	       (file+olp "~/org/common/task.org" "Tasks" "Study")
	       "* %^{任务名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("tw" "Work Task" entry
	       (file+function "~/org/private/work.org" (lambda () (find-tree-location (get-work-tree))))
	       "* TODO %^{任务名}\n%U\n" :clock-in t :clock-resume t ))

;; daily 相关
(add-to-list 'org-capture-templates '("d" "Daily"))
(add-to-list 'org-capture-templates
	     '("dr" "Read Book Task" entry
	       (file+olp "~/org/common/daily.org" "Daily" "Reading")
	       "* %^{书名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("dt" "Tool Task" entry
	       (file+olp "~/org/common/daily.org" "Daily" "Tool")
	       "* %^{任务名}\n%U\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
	     '("ds" "Study Task" entry
	       (file+olp "~/org/common/daily.org" "Daily" "Study")
	       "* %^{任务名}\n%U\n" :clock-in t :clock-resume t))
;; note 相关
(add-to-list 'org-capture-templates '("n" "Notes"))
;; 日志/日记相关
(add-to-list 'org-capture-templates
             '("j" "Journal" entry (file+datetree "~/org/common/journal.org")
               "* %U - %^{heading}\n  %?"))
;; 账单相关
(add-to-list 'org-capture-templates '("b" "Billing"))
(add-to-list 'org-capture-templates
	     '("bg" "Game Billing" plain
	       (file+function "~/org/common/billing.org" find-month-tree)
	       " | %u | 游戏 | %^{描述} | %^{金额} |" :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("bl" "Life Billing" plain
	       (file+function "~/org/common/billing.org" find-month-tree)
	       " | %u | 生活 | %^{描述} | %^{金额} |" :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("bp" "Piety Parent" plain
	       (file+function "~/org/common/billing.org" find-month-tree)
	       " | %u | 孝敬父母 | %^{描述} | %^{金额} |" :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("bh" "Home Output" plain
	       (file+function "~/org/common/billing.org" find-month-tree)
	       " | %u | 家庭支出 | %^{描述} | %^{金额} |" :kill-buffer t))
;; 管理密码
(defun random-alphanum ()
  (let* ((charset "abcdefghijklmnopqrstuvwxyz0123456789")
         (x (random 36)))
    (char-to-string (elt charset x))))

(defun create-password ()
  (let ((value ""))
    (dotimes (number 16 value)
      (setq value (concat value (random-alphanum))))))


(defun get-or-create-password ()
  (setq password (read-string "Password: "))
  (if (string= password "")
      (create-password)
    password))

(add-to-list 'org-capture-templates
             '("s" "Security/Password" entry (file "~/org/common/passwords.org.cpt")
               "* %^{title} %^G\n\n  - 用户名: %^{用户名}\n  - 密码: %(get-or-create-password)\n  - 时间: %U"
               :empty-lines 1 :kill-buffer t))
;; 新建博客文章
;; 网页管理
(add-to-list 'org-capture-templates '("p" "Protocol"))
(add-to-list 'org-capture-templates
             '("pb" "Protocol Bookmarks" entry
               (file+headline "~/org/common/web.org" "Bookmarks")
               "* %U - %:annotation\n" :immediate-finish t :kill-buffer t))
(add-to-list 'org-capture-templates
             '("pn" "Protocol Notes" entry
               (file+headline "~/org/common/web.org" "Notes")
               "* %U - %:annotation\n %:initial\n" :empty-lines 1 :immediate-finish t :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("pt" "Protocol Task" entry
	       (file+olp "~/org/common/task.org" "Tasks" "Tool")
	       "* %:description\n%U\n" :immediate-finish t :kill-buffer t))
(add-to-list 'org-capture-templates
	     '("ps" "Protocol Study" entry
	       (file+olp "~/org/common/task.org" "Tasks" "Study")
	       "* %:description\n%U\n" :immediate-finish t :kill-buffer t))

(defun org-capture-template-goto-link ()
  (org-capture-put :target (list 'file+headline
                                 (nth 1 (org-capture-get :target))
                                 (org-capture-get :annotation)))
  (org-capture-put-target-region-and-position)
  (widen)
  (let ((hd (nth 2 (org-capture-get :target))))
    (goto-char (point-min))
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd)) nil t)
        (org-end-of-subtree)
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n"))))
(add-to-list 'org-capture-templates
             '("pa" "Protocol Annotation" plain
               (file+function "~/org/common/web.org" org-capture-template-goto-link)
               "  %U - %?\n\n  %:initial" :empty-lines 1))
;; Anki 卡片

;; source code block
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                                           'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                                           'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                                           'org-insert-src-block)
                            ))

(setq org-src-fontify-natively t)

(provide 'init-org)
