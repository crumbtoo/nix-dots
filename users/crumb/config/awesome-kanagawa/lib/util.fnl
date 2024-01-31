(local gears            (require :gears))

(fn rrect [rad]
  (fn [cr w h]
    (gears.shape.rounded_rect cr w h rad)))

{ : rrect
}

