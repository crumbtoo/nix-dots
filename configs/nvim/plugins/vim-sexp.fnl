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
  (map! [nxo :buffer] :B "<Plug>(sexp_move_to_prev_element_head)"
        "move to prev element head")
  (map! [nxo :buffer] :W "<Plug>(sexp_move_to_next_element_head)"
        "move to next element head")
  (map! [nxo :buffer] :gE "<Plug>(sexp_move_to_prev_element_tail)"
        "move to prev element tail")
  (map! [nxo :buffer] :E "<Plug>(sexp_move_to_next_element_tail)"
        "move to next element tail")
  (map! [nxo :buffer] "[[" "<Plug>(sexp_move_to_prev_top_element)"
        "move to prev top-level element")
  (map! [nxo :buffer] "]]" "<Plug>(sexp_move_to_next_top_element)"
        "move to next top-level element")

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
  (map! [nxo :buffer] "<LocalLeader>W"  "<Plug>(sexp_round_head_wrap_element)")
  (map! [nxo :buffer] "<LocalLeader>w"  "<Plug>(sexp_round_tail_wrap_element)")
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
        "swap atom backwards")
  (map! [n :buffer] :>e "<Plug>(sexp_swap_element_forward)"
        "swap atom forward")

  ;; slurp/barf
  (map! [n :buffer] ">(" "<Plug>(sexp_emit_head_element)"
                 "barf forwards")
  (map! [n :buffer] "<)" "<Plug>(sexp_emit_tail_element)"
                 "barf backwards")
  (map! [n :buffer] ">)" "<Plug>(sexp_capture_prev_element)"
                 "slurp forwards")
  (map! [n :buffer] "<(" "<Plug>(sexp_capture_next_element)"
                 "slurp backwards"))

(augroup! :vim_sexp_mapping
          [[FileType] [fennel lisp clojure scheme]
           `vim-sexp-mappings])

