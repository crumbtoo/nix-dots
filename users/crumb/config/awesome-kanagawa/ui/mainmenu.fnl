(local awful        (require :awful))
(local beautiful    (require :beautiful))
; (local apps         (require :config.apps))

(local myawesomemenu
  [ [ "restart" awesome.restart ]
  ])

(awful.menu
   { :items [ [ "awesome" myawesomemenu beautiful.awesome_icon ]
              [ "open terminal" "wezterm" ]
            ]
   })

