(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)
(local uv (require :luv))

;;; whitespace
(set! tabstop 2)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! expandtab)

(set vim.b.rulestring
     ";------------------------------------------------------------------------------;")

; (local *swank-command*
;   [ "ros" "run"
;     "--eval" "(ql:quickload :swank)"
;     "--eval" "(swank:create-server :dont-close t)" ])

; (set _G.swank-process nil)

; (fn start-swank []
;   (when (not _G.swank-handle)
;     (let [[cmd & args] *swank-command*
;           (handle pid) (uv.spawn cmd
;                                  {: args}
;                                  (fn [c]
;                                    (print "ros exited with exit code: " c)))]
;       (set _G.swank-process {: handle : pid})))
;   (print _G.swank-process.pid))

; (start-swank)

; (print *swank-command*)

