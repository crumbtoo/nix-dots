(local ls (require :luasnip))
(local t ls.text_node)
(local i ls.insert_node)
(local fmt (. (require :luasnip.extras.fmt) :fmt))
(local fmta (. (require :luasnip.extras.fmt) :fmta))
(import-macros {: s : s*
                : simple-env : choice-env : starred-env}
               :lib.snippet-macros)

[ (s* :beg
      :\begin..\end
      "\\begin{$1}\n\t$2\n\\end{$1}")
  (starred-env :beq "equation[*]" :equation)
  (starred-env :bal "align[*]" :align)
  (starred-env :bce "center[*]" :center)
]

