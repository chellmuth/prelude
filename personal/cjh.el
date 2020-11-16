; Use helm-gtags
(prelude-require-package 'helm-gtags)

(custom-set-variables
 '(helm-gtags-prefix-key (kbd "C-c g"))
 '(helm-gtags-suggested-key-mapping t))

(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "C-t") nil)) ; I use this for 'transpose-char

(add-hook 'c++-mode-hook 'helm-gtags-mode)

; CUDA hooks for projectile
(custom-set-variables
 '(projectile-other-file-alist
   '(("cu" "h" "hpp")
     ("cpp" "h" "hpp")
     ("hpp" "h" "cpp" "cu")
     ("c" "h")
     ("h" "c" "cpp" "cu")
     ("vert" "frag")
     ("frag" "vert"))))

; Treat CUDA like c++
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

; My preferred namespace indentation
(defun my-c++-setup ()
  (c-set-offset 'innamespace [0]))
(add-hook 'c++-mode-hook 'my-c++-setup)

; https://emacs.stackexchange.com/questions/3779/how-do-i-turn-off-smartparens-when-using-prelude
(defun disable-smartparens ()
  (smartparens-mode -1))
(add-hook 'smartparens-enabled-hook 'disable-smartparens t)

;; (defun disable-flycheck-mode ()
;;   (interactive)
;;   (flycheck-mode -1))
;; (add-hook 'prog-mode-hook 'disable-flycheck-mode)
;; (add-hook 'prog-mode-hook 'flycheck-mode)

; Turn off some prelude-programming.el settings
(defun my-prog-mode-defaults ()
  "Override undesired prelude defaults"
  (smartparens-mode -1)
  (flycheck-mode -1))

(setq prelude-flyspell nil)
(add-hook 'prelude-prog-mode-hook 'my-prog-mode-defaults)

(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))

; rects
(custom-set-variables
 '(cua-auto-tabify-rectangles nil)
 '(cua-enable-cua-keys nil)
 '(cua-enable-cursor-indications t)
 '(cua-mode t nil (cua-base))
)

(defun my-c++-mode-hook ()
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(setq prelude-whitespace nil)

; Save buffer state on quit
(desktop-save-mode 1)
