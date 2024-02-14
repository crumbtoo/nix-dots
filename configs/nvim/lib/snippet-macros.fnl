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

(fn simple-env [trig desc env]
  (let [s (string.format "\\begin{${2:%s}}\n\t$1\n\\end{${2:%s}}"
                         env env)]
    (s* trig desc s)))

(fn choice-env [trig desc env]
  (let [s (string.format "\\begin{${2|%s|}}\n\t$1\n\\end{${2|%s|}}"
                         env env)]
    (s* trig desc s)))

(fn starred-env [trig desc env]
  (let [env* (.. env "*")
        s (string.format "\\begin{${2|%s,%s|}}\n\t$1\n\\end{$2}"
                         env* env)]
    (s* trig desc s)))

{ : s
  : s*
  : simple-env
  : choice-env
  : starred-env
}

