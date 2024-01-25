(local awful        (require :awful))
(local beautiful    (require :beautiful))
(local wibox        (require :wibox))
(import-macros {: wgt : btn} :lib.macros)

(fn top-widgets [s]
  (wgt
    { :layout wibox.layout.align.vertical }
    (wibox.widget.textbox :top)))

(fn middle-widgets [s]
  (wgt
    { :layout wibox.layout.align.vertical }
    (wibox.widget.textbox :mid)))

(fn bottom-widgets [s]
  (wgt
    { :layout wibox.layout.align.vertical }
    (wibox.widget.textbox :bot)))

(fn empanel [w]
  (wgt
    { :widget   wibox.container.background
      :shape    beautiful.wibar_shape
      :bg       beautiful.bg_panel }
    (wgt
      { :widget   wibox.container.margin
        :margins  beautiful.empanel_margins }
      w)))

(fn taglist [s]
  (let [on-create
          (fn [self t index objs]
            ; TODO: change colour on urgent
            ; call on-update to correctly initialise icons
            (self:update_callback t index objs))
        on-update
          (fn [self t index objects]
            (let [ ir (. (self:get_children_by_id :tag_icon) 1)
                   empty? (= (length (t:clients)) 0)]
              (if t.selected
                  (doto ir
                    (tset :text     beautiful.tag_icon_focus)
                    (tset :opacity  beautiful.tag_icon_focus_opacity))
                  (doto ir
                    (tset :text     (if empty?
                                        beautiful.tag_icon_empty
                                        beautiful.tag_icon_occ))
                    (tset :opacity  beautiful.tag_icon_unfocus_opacity)))))]
    (awful.widget.taglist
      { :screen     s
        :filter     awful.widget.taglist.filter.all
        :layout     wibox.layout.fixed.vertical
        :buttons    [ (btn [    ] :lmb #($:view_only))
                      (btn [:mod] :lmb #(when client.focus
                                          (client.focus:toggle_tag $))) ]
        :widget_template
        (wgt
          { :id     :background_role
            :create_callback on-create
            :update_callback on-update
            :shape  beautiful.taglist_shape
            :widget wibox.container.background }
          (wgt
            { :id     :tag_icon
              :font   beautiful.taglist_font
              :halign :center
              :valign :center
              :widget wibox.widget.textbox }))
      })))

(fn [s]
  (awful.wibar
    { :position     :left
      :screen       s
      :stretch      false
      :height       beautiful.wibar_height
      :width        beautiful.wibar_width
      :shape        beautiful.wibar_shape
      :margins      beautiful.wibar_margins 
      :widget
        (wgt
          { :layout wibox.layout.align.vertical
          }
          (empanel (taglist s))
          (wgt
            { :widget wibox.widget.textbox
              :halign :center
              :valign :center
              :text "hi"
            })
          (empanel (bottom-widgets s)))
    }))

