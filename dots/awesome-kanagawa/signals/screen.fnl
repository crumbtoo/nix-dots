(local awful        (require :awful))
(local gears        (require :gears))
(local beautiful    (require :beautiful))
(local wibox        (require :wibox))
(local wibar        (require :ui.bar))

(screen.connect_signal :request::wallpaper
  (fn [s]
    (awful.wallpaper
      { :screen s
        :widget { :widget                 wibox.widget.imagebox
                  :image                  beautiful.wallpaper
                  :horizontal_fit_policy :fit
                  :vertical_fit_policy   :fit }
      })))

(screen.connect_signal :request::desktop_decoration
  (let [tags [:0 :1 :2 :3 :4 :5 :6 :7 :8 :9]]
    (fn [s]
      (awful.tag tags s (. awful.layout.layouts 1))
      (tset s :mywibar (wibar s)))))

