{ :make-repl
    (. (require :toggleterm.terminal) :Terminal :new)
    ; (fn [opts]
    ;   (let [T (. (require :toggleterm.terminal) :Terminal)]
    ;     (T:new
    ;       { :cmd                  opts.cmd
    ;         :id                   (or opts.id 0)
    ;         :terminal_mappings    true
    ;         :hidden               (or opts.hidden true)
    ;         :persist_size         (or opts.persist-size false)
    ;         :direction            (or opts.direction :horizontal)
    ;         :dir                  opts.dir
    ;       })))
}

