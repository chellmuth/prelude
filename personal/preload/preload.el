(eval-after-load "prelude-mode.el" '(define-key prelude-mode-map (kbd "M-o") nil))
(eval-after-load "prelude-mode.el" '(define-key prelude-mode-map (kbd "C-c g") nil))

(defvar cjh-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-o") 'ace-window)
    (define-key map (kbd "C-w") 'backward-kill-word)
    (define-key map (kbd "M-k") 'kill-region)
    (define-key map (kbd "C-M-t") 'toggle-truncate-lines)
    (define-key map (kbd "C-c t") 'transpose-chars)
    (define-key map (kbd "C-c w") 'delete-trailing-whitespace)
    (define-key map (kbd "M-K") 'kill-current-buffer)
    (define-key map (kbd "M-N") 'bs-cycle-next)
    (define-key map (kbd "M-P") 'bs-cycle-previous)
    map)
  "Personal keymap")

;; define minor mode
(define-minor-mode cjh-mode
  "Minor mode for my custom keymaps

  \\{cjh-mode-map}"
  :lighter " cjh"
  :keymap cjh-mode-map
  :global t)

(provide 'cjh-mode)
(cjh-mode t)
