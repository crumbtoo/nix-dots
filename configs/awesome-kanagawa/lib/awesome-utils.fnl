(local gears            (require :gears))
(local wibox            (require :wibox))
(local utils            (require :lib.util))

(fn wgt* [prop ...]
  (wibox.widget (utils.merge prop [...])))

(fn rrect [rad]
  (fn [cr w h]
    (gears.shape.rounded_rect cr w h rad)))

{ : rrect
  : wgt*
}

