;; copy from https://github.com/manateelazycat/auto-save/blob/master/auto-save.el
(defgroup auto-save nil
  "Auto save file when emacs idle."
  :group 'auto-save)

(defcustom auto-save-idle 1
  "The idle seconds to auto save file."
  :type 'integer
  :group 'auto-save)

(defcustom auto-save-silent nil
  "Nothing to dirty minibuffer if this option is non-nil."
  :type 'boolean
  :group 'auto-save)

(defcustom auto-save-delete-trailing-whitespace nil
  "Delete trailing whitespace when save if this option is non-nil.
Note, this option is non-nil, will delete all training whitespace execpet current line,
avoid delete current indent space when you programming."
  :type 'boolean
  :group 'auto-save)

(defvar auto-save-disable-predicates
  nil "disable auto save in these case.")

;; Emacs' default auto-save is stupid to generate #foo# files!
(setq auto-save-default nil)
(setq create-lockfiles nil)

(defun auto-save-buffers ()
  (interactive)
  (let ((autosave-buffer-list))
    (ignore-errors
      (save-excursion
        (dolist (buf (buffer-list))
          (set-buffer buf)
          (when (and
                 ;; Buffer associate with a filename?
                 (buffer-file-name)
                 ;; Buffer is modifiable?
                 (buffer-modified-p)
                 ;; Yassnippet is not active?
                 (or (not (boundp 'yas--active-snippets))
                     (not yas--active-snippets))
                 ;; Company is not active?
                 (or (not (boundp 'company-candidates))
                     (not company-candidates))
                 ;; tell auto-save don't save
                 (not (seq-some (lambda (predicate)
                                  (funcall predicate))
                                auto-save-disable-predicates)))
            (push (buffer-name) autosave-buffer-list)
            (if auto-save-silent
                ;; `inhibit-message' can shut up Emacs, but we want
                ;; it doesn't clean up echo area during saving
                (with-temp-message ""
                  (let ((inhibit-message t))
                    (basic-save-buffer)))
              (basic-save-buffer))
            ))
        ;; Tell user when auto save files.
        (unless auto-save-silent
          (cond
           ;; It's stupid tell user if nothing to save.
           ((= (length autosave-buffer-list) 1)
            (message "# Saved %s" (car autosave-buffer-list)))
           ((> (length autosave-buffer-list) 1)
            (message "# Saved %d files: %s"
                     (length autosave-buffer-list)
                     (mapconcat 'identity autosave-buffer-list ", ")))))
        ))))

(defun auto-save-delete-trailing-whitespace-except-current-line ()
  (interactive)
  (when auto-save-delete-trailing-whitespace
    (let ((begin (line-beginning-position))
          (end (line-end-position)))
      (save-excursion
        (when (< (point-min) begin)
          (save-restriction
            (narrow-to-region (point-min) (1- begin))
            (delete-trailing-whitespace)))
        (when (> (point-max) end)
          (save-restriction
            (narrow-to-region (1+ end) (point-max))
            (delete-trailing-whitespace)))))))

(defvar auto-save-timer nil)

(defun auto-save-set-timer ()
  "Set the auto-save timer.
Cancel any previous timer."
  (auto-save-cancel-timer)
  (setq auto-save-timer
        (run-with-idle-timer auto-save-idle t 'auto-save-buffers)))

(defun auto-save-cancel-timer ()
  (when auto-save-timer
    (cancel-timer auto-save-timer)
    (setq auto-save-timer nil)))

(defun auto-save-enable ()
  (interactive)
  (auto-save-set-timer)
  (add-hook 'before-save-hook 'auto-save-delete-trailing-whitespace-except-current-line)
  (add-hook 'before-save-hook 'font-lock-flush)
  )

(defun auto-save-disable ()
  (interactive)
  (auto-save-cancel-timer)
  (remove-hook 'before-save-hook 'auto-save-delete-trailing-whitespace-except-current-line)
  (remove-hook 'before-save-hook 'font-lock-flush)
  )
;; end copy

;; (auto-save-enable)              ;; 开启自动保存功能
;; (setq auto-save-slient t)       ;; 自动保存的时候静悄悄的， 不要打扰我

(if evil-mode
    (add-hook 'evil-insert-state-exit-hook 'save-buffer) ;; 离开插入模式时保存当前文件
  nil)

(provide 'init-auto-save)
