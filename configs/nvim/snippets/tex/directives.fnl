(local ls (require :luasnip))
; (local s ls.snippet)
(local t ls.text_node)
(local i ls.insert_node)
(local fmt (. (require :luasnip.extras.fmt) :fmt))
(local fmta (. (require :luasnip.extras.fmt) :fmta))
(import-macros {: s : s*} :lib.snippet-macros)

;; be careful with this file -- should any runtime errors occur, luasnip does
;; not say anything and just silently aborts loading the entire file.

[ (s :tt
     :\texttt
     (fmta "\\texttt{<>}"
           [(i 1)]))
  (s :ff
     :\frac
     (fmta "\\frac{<>}{<>}"
           [(i 1) (i 2)]))
]

