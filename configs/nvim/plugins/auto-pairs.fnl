(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(augroup! :AutopairsLisp
  [[FileType] [fennel lisp clojure scheme]
    `(b! AutoPairs (vim.fn.AutoPairsDefine {"(" ")"}
                                           ["'" "`"]))])

