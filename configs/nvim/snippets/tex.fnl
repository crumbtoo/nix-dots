(local ls (require :luasnip))
; (local s ls.snippet)
(local t ls.text_node)
(local i ls.insert_node)
(local fmt (. (require :luasnip.extras.fmt) :fmt))
(local fmta (. (require :luasnip.extras.fmt) :fmta))

;; be careful with this file -- should any runtime errors occur, luasnip does
;; not say anything and just silently aborts loading the entire file.

(macro s [trig ?dscr body extra]
  (let [opts (or (?. extra :opts) {})
        adv-opts (or (?. extra :adv-opts) {})
        opts* (doto (or opts {})
                    (tset :trig trig)
                    (tset :dscr ?dscr))]
    `(ls.snippet
       ,opts* ,body ,adv-opts)))

[ (s :tt
     :\textt
     (fmta "\\texttt{<>}"
           [(i 1)]))
  (s :ff
     :\frac
     (fmt "\\frac{<>}{<>}"
          [(i 1) (i 2)]
          {:delimiters :<>}))
  (ls.parser.parse_snippet
    {:trig :lsp}
    "$1 is ${2|hard,easy,challenging|}")
]
