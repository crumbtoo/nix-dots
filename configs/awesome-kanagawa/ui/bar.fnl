(local gears        (require :gears))
(local awful        (require :awful))
(local beautiful    (require :beautiful))
(local wibox        (require :wibox))
(local util         (require :lib.util))
(local rubato       (require :lib.rubato))
(local colour       (require :lib.color))
(local {: wgt*}     (require :lib.awesome-utils))
(import-macros {: wgt : btn} :lib.macros)

(fn taglist [s]
  (let [tagtrans (colour.transition (colour.color {:hex beautiful.fg_unselect})
                                    (colour.color {:hex beautiful.fg_select}))
        on-create
          (fn [self t index objs]
            ; TODO: change colour on urgent
            ; call on-update to correctly initialise icons
            (local taganim (rubato.timed
                             { :duration 0.2
                               :intro    0.1
                               :subscribed (fn [pos] (when (not t.selected)
                                              (set self.circ.bg (. (tagtrans pos) :hex)))) }))
            (self.circ:connect_signal :mouse::enter
              (fn []
                (set taganim.target 1)))
            (self.circ:connect_signal :mouse::leave
              (fn []
                (set taganim.target 0)))
            (self:update_callback t index objs)
            )
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
            { :id     :circ
              :widget wibox.container.background
              :bg     beautiful.fg_unselect
              :shape  gears.shape.circle }
            (wgt
              { :id     :tag_icon
                :font   beautiful.taglist_font
                :halign :center
                :valign :center
                :widget wibox.widget.textbox })))
      })))

(local text-clock
  (wibox.widget
    { :format   "%H\n%M"
      :font     beautiful.textclock_font
      :halign   :center
      :valign   :center
      :widget   wibox.widget.textclock }))

(fn tasklist [s]
  (wgt
    { :widget wibox.container.margin
      :margins beautiful.tasklist_margins }
    (awful.widget.tasklist
      { :filter awful.widget.tasklist.filter.currenttags
        :layout { :layout wibox.layout.fixed.vertical
                  :spacing beautiful.tasklist_spacing }
        :screen s
        :widget_template
          (wgt
            { :widget wibox.container.margin
              :margins beautiful.tasklist_icon_margins }
            (wgt
              { :id :icon_role
                :widget wibox.widget.imagebox }))})))

(fn layout-box [s]
  (awful.widget.layoutbox
    { :screen s
      :buttons [ (btn [] :lmb #(awful.layout.inc  1))
                 (btn [] :rmb #(awful.layout.inc -1))
               ]}))

(local nix-logo
  (wibox.container.constraint
    { :strategy :max
      :widget
      (wgt*
        { :widget wibox.container.margin
          :margins 4 }
        (wgt
          { :widget wibox.widget.imagebox
            :halign :center
            :valign :center
            :resize true
            :image beautiful.wibar_logo }))
    }))

(fn [s]
  (awful.wibar
    { :position     :left
      :screen       s
      :stretch      false
      :height       beautiful.wibar_height
      :width        beautiful.wibar_width
      ; :margins      beautiful.wibar_margins 
      :widget
        (wgt
          { :layout wibox.layout.align.vertical } 
          (wgt {:layout wibox.layout.fixed.vertical}
               nix-logo
               (taglist s))
          (tasklist s)
          (wgt {:layout wibox.layout.fixed.vertical}
               text-clock
               (layout-box s)))
    }))

