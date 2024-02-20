(local awful        (require :awful))
(local gears        (require :gears))
(local beautiful    (require :beautiful))
(local wibox        (require :wibox))

(screen.connect_signal :request::wallpaper
  (fn [s]
    (awful.wallpaper
      { :screen s
        :widget { :widget                 wibox.widget.imagebox
                  :image                  beautiful.wallpaper
                  :horizontal_fit_policy :fit
                  :vertical_fit_policy   :fit } })))

