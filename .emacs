(keyboard-translate ?\C-h ?\C-?)

(setq make-backup-files nil)

(setq el-get-sources '(
		       (:name anything :after (lambda () (define-key global-map (kbd "C-;") 'anything)))
		       (:name caml-mode :after (lambda () nil))
		       ))



;; 以下el-getのインストール
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; もし el-get がなければインストールを行う
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (end-of-buffer)
       (eval-print-last-sexp)))))
  (require 'el-get)
