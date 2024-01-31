(local npairs (require :nvim-autopairs))
(local rule (require :nvim-autopairs.rule))
(local ts-conds (require :nvim-autopairs.ts-conds))

(npairs.setup
  { :check_ts true
  })

(macro ft-rules [fts ...]
  `(->> ,fts ,...))

(tset (npairs.get_rules "`") 1 :not_filetypes
      [ :lisp :fennel ])

(npairs.add_rules
  [ (ft-rules [:tex :plaintex]
      (rule :$ :$))
  ])

