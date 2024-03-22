(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(fn vim-sexp-mappings []
  ;; text objects
  (map! [xo :buffer] :af "<Plug>(sexp_outer_list)"
        "around form")
  (map! [xo :buffer] :if "<Plug>(sexp_inner_list)"
        "inside form")
  (map! [xo :buffer] :aF "<Plug>(sexp_outer_top_list)"
        "around root form")
  (map! [xo :buffer] :iF "<Plug>(sexp_inner_top_list)"
        "inside root form")
  (map! [xo :buffer] :ae "<Plug>(sexp_outer_element)"
        "around element")
  (map! [xo :buffer] :ie "<Plug>(sexp_inner_element)"
        "inner element")

  ;; movement
  (map! [nxo :buffer] "<C-b>" "<Plug>(sexp_move_to_prev_element_head)"
        "move to prev element head")
  (map! [nxo :buffer] "<C-w>" "<Plug>(sexp_move_to_next_element_head)"
        "move to next element head")
  (map! [nxo :buffer] "<C-g><C-e>" "<Plug>(sexp_move_to_prev_element_tail)"
        "move to prev element tail")
  (map! [nxo :buffer] "<C-e>" "<Plug>(sexp_move_to_next_element_tail)"
        "move to next element tail")
  (map! [nxo :buffer] "[[" "<Plug>(sexp_move_to_prev_top_element)"
        "move to prev top-level element")
  (map! [nxo :buffer] "]]" "<Plug>(sexp_move_to_next_top_element)"
        "move to next top-level element")

  ;; flow
  (map! [nxo :buffer] "<C-p>" "<Plug>(sexp_flow_to_next_open)"
        "flow to next open")
  (map! [nxo :buffer] "<C-o>" "<Plug>(sexp_flow_to_prev_open)"
        "flow to prev open")
  (map! [nxo :buffer] "<C-]>" "<Plug>(sexp_flow_to_next_close)"
        "flow to next close")
  (map! [nxo :buffer] "<C-[>" "<Plug>(sexp_flow_to_prev_close)"
        "flow to prev close")
  (map! [nxo :buffer] "W" "<Plug>(sexp_flow_to_next_leaf_head)"
        "flow to next leaf head")
  (map! [nxo :buffer] "B" "<Plug>(sexp_flow_to_prev_leaf_head)"
        "flow to prev leaf head")
  (map! [nxo :buffer] "gE" "<Plug>(sexp_flow_to_prev_leaf_tail)"
        "flow to prev leaf tail")
  (map! [nxo :buffer] "E" "<Plug>(sexp_flow_to_next_leaf_tail)"
        "flow to next leaf tail")

  ;; align
  (map! [nxo :buffer] "==" "<Plug>(sexp_indent)"
        "align [count] surrounding forms")
  (map! [nxo :buffer] "=-" "<Plug>(sexp_indent_top)"
        "align [count] surrounding forms without moving")

  ;; wrap
  ; wrap form
  (map! [nxo :buffer] "<LocalLeader>i" "<Plug>(sexp_round_head_wrap_list)")
  (map! [nxo :buffer] "<LocalLeader>I" "<Plug>(sexp_round_tail_wrap_list)")
  (map! [nxo :buffer] "<LocalLeader>[" "<Plug>(sexp_square_head_wrap_list)")
  (map! [nxo :buffer] "<LocalLeader>]" "<Plug>(sexp_square_tail_wrap_list)")
  (map! [nxo :buffer] "<LocalLeader>{" "<Plug>(sexp_curly_head_wrap_list)")
  (map! [nxo :buffer] "<LocalLeader>}" "<Plug>(sexp_curly_tail_wrap_list)")
  ; wrap element
  (map! [nxo :buffer] "<LocalLeader>w"  "<Plug>(sexp_round_head_wrap_element)")
  (map! [nxo :buffer] "<LocalLeader>W"  "<Plug>(sexp_round_tail_wrap_element)")
  (map! [nxo :buffer] "<LocalLeader>e[" "<Plug>(sexp_square_head_wrap_element)")
  (map! [nxo :buffer] "<LocalLeader>e]" "<Plug>(sexp_square_tail_wrap_element)")
  (map! [nxo :buffer] "<LocalLeader>e{" "<Plug>(sexp_curly_head_wrap_element)")
  (map! [nxo :buffer] "<LocalLeader>e}" "<Plug>(sexp_curly_tail_wrap_element)")
  ; raise
  (map! [nx :buffer] "<localleader>o" "<Plug>(sexp_raise_list)"
        "raise form")
  (map! [nx :buffer] "<localleader>O" "<Plug>(sexp_raise_element)"
        "raise element")

  ;; insert
  (map! [n :buffer] "<localleader>h" "<Plug>(sexp_insert_at_list_head)"
        "insert at list head")
  (map! [n :buffer] "<localleader>t" "<Plug>(sexp_insert_at_list_tail)"
        "insert at list tail")

  ;; move/swap
  (map! [n :buffer] :<f "<Plug>(sexp_swap_list_backward)"
        "swap form backwards")
  (map! [n :buffer] :>f "<Plug>(sexp_swap_list_forward)"
        "swap form backwards")
  (map! [n :buffer] :<e "<Plug>(sexp_swap_element_backward)"
        "swap element backwards")
  (map! [n :buffer] :>e "<Plug>(sexp_swap_element_forward)"
        "swap element forward")

  ;; slurp/barf
  (map! [n :buffer] ">(" "<Plug>(sexp_emit_head_element)"
        "barf forwards")
  (map! [n :buffer] "<)" "<Plug>(sexp_emit_tail_element)"
        "barf backwards")
  (map! [n :buffer] ">)" "<Plug>(sexp_capture_next_element)"
        "slurp forwards")
  (map! [n :buffer] "<(" "<Plug>(sexp_capture_prev_element)"
        "slurp backwards"))

(augroup! :vim_sexp_mapping
          [[FileType] [fennel lisp clojure scheme]
           `vim-sexp-mappings])

;; we have to define some syntax rules for vim-sexp to work properly.
;; by default, vim-sexp will completely ignore fennel strings and not treat
;; them as atoms. vim-sexp will also incorrectly match parens inside strings.

;; these syntax commands alone don't work for some fucking mysterious reason, so
;; we also wrap it in an autocmd

(augroup! :BullshitFTPluginSyntaxHack
  ;; fennel is special in that the `:' syntax is used for strings
  [[FileType] [fennel]
    `(vim.cmd "syntax match string /:[^()\\[\\]\\{\\}\"'\\~\\@`,;]+/")]
  [[FileType] [fennel lisp clojure scheme] 
    `(do (vim.cmd "syntax region string start=/\"/ skip=/\\\\\"/ end=/\"/")
         (vim.cmd "syntax region comment start=/;/ end=/$/"))])

