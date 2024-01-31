; (fn fix-opts [trig dscr extra]
;   (let [opts (or (?. extra :opts) {})
;         adv-opts (or (?. extra :adv-opts) {})]
;     (tset opts :trig trig)
;     (tset opts :dscr dscr)
;     {: opts : adv-opts}))

(fn fix-opts [trig dscr extra]
  (let [adv-opts (or (?. extra :adv-opts) {})
        opts     (or (?. extra :opts)     {})]
    (doto opts
      (tset :trig trig)
      (tset :dscr dscr))
    {: opts : adv-opts}))

(fn s [trig ?dscr body extra]
  (let [{: adv-opts : opts} (fix-opts trig ?dscr extra)]
    `(let [ls# (require :luasnip)]
      (ls#.snippet
        ,opts ,body ,adv-opts))))

(fn s* [trig ?dscr body extra]
  (let [{: adv-opts : opts} (fix-opts trig ?dscr extra)]
    `(let [ls# (require :luasnip)]
       (ls#.parser.parse_snippet
         ,opts ,body ,adv-opts))))

{ : s : s* }

