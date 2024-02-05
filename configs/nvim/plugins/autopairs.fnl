(local npairs (require :nvim-autopairs))
(local rule (require :nvim-autopairs.rule))
(local ts-conds (require :nvim-autopairs.ts-conds))

(npairs.setup
  { :check_ts false
    :enable_check_bracket_line false
    :map_cr true
  })

(macro ft-rules [fts ...]
  `(->> ,fts ,...))

; (tset (npairs.get_rules "`") 1 :not_filetypes
;       [ :lisp :fennel ])

; remove '`' rule on lisp
(-?> (npairs.get_rules "'")
     (tset 1 :not_filetypes [ :fennel :lisp ]))
(-?> (npairs.get_rules "`")
     (tset 1 :not_filetypes [ :fennel :lisp ]))

(npairs.add_rules
  [ (ft-rules [:tex :plaintex]
      (rule :$ :$))
  ])

