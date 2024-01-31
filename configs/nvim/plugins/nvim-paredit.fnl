(fn []
  (let [p (require :nvim-paredit)]
    (p.setup
      { :filetype [ :fennel ]
        :use_default_keys true
        :indent { :enabled true }
        :keys
          { :<localleader>w
              [ (fn []
                  (p.cursor.place_cursor
                    (p.wrap.wrap_element_under_cursor "( " ")")
                    { :mode :insert
                      :placement :inner_start }))
                "Wrap element insert head" ]
            :<localleader>W
              [ (fn []
                  (p.cursor.place_cursor
                    (p.wrap.wrap_element_under_cursor "(" ")")
                    { :mode :insert
                      :placement :inner_end }))
                "Wrap element insert tail" ]
            :<localleader>i
              [ (fn []
                 (p.cursor.place_cursor
                   (p.wrap.wrap_enclosing_form_under_cursor "( " ")")
                   { :mode :insert
                     :placement :inner_start }))
               "Wrap form insert head" ]
            :<localleader>I
              [ (fn []
                 (p.cursor.place_cursor
                   (p.wrap.wrap_enclosing_form_under_cursor "(" ")")
                     { :mode :insert
                       :placement :inner_end }))
               "Wrap form insert tail" ]
          }
      })))

