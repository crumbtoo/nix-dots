(local awful        (require :awful))
(local gears        (require :gears))
(local beautiful    (require :beautiful))
(local wibox        (require :wibox))
(local wibar        (require :ui.bar))
(local fennel       (require :lib.fennel))

(local *layouts* [ awful.layout.suit.tile
                   awful.layout.suit.floating
                 ])

(tag.connect_signal :request::default_layouts
  #(awful.layout.append_default_layouts *layouts*))

; (screen.connect_signal :request::desktop_decoration
;   (let [tags [:1 :2 :3 :4 :5 :6 :7 :8 :9 :0]]
;     (fn [s]
;       (awful.tag tags s awful.layout.suit.tile)
;       (tset s :mywibar (wibar s)))))

(macro range [i j]
  (fcollect [n i j]
    n))

(screen.connect_signal :request::desktop_decoration
  (fn [s]
    (each [_ n (pairs [1 2 3 4 5 6 7 8 9 0])]
      (awful.tag.add
        (tostring n)
        { :screen s
          :layout (if (= n 2)
                      (. *layouts* 2)
                      (. *layouts* 1)) }))
    (tset s :mywibar (wibar s))))

