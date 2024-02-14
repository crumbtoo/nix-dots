(local awful (require :awful))
(local ruled (require :ruled))

(ruled.client.connect_signal :request::rules
  (fn []
    (ruled.client.append_rule
      { :id     :global
        :rule   { }
        :properties
          { :focus      awful.client.focus.filter
            :raise      true
            :screen     awful.screen.preferred
            :placement  (+ awful.placement.no_overlap awful.placement.no_offscreen)
          }
      })
    (ruled.client.append_rule
      { :id :floating
        :properties {:floating true}
        :rule_any
        { :class [ :Arandr
                   :Blueman-manager
                   :Gpick
                   :Kruler
                   :Sxiv
                   :Wpa_gui
                   :veromix
                   :xtightvncviewer
                 ]
          :instance [:copyq :pinentry]
          :name ["Event Tester"]
          :role [ :AlarmWindow
                  :ConfigManager
                  :pop-up
                ]
        }
      })
    (ruled.client.append_rule
      { :id         :titlebars
        :properties { :titlebars_enabled true }
        :rule_any   { :type [:normal :dialog] }
      })))

