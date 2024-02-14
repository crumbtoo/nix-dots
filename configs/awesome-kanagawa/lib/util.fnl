(local gears            (require :gears))
(local wibox            (require :wibox))

(fn rrect [rad]
  (fn [cr w h]
    (gears.shape.rounded_rect cr w h rad)))

(fn merge [...]
  (accumulate [merged { }
               _ t (pairs [...])]
    (collect [k v (pairs t) &into merged]
      k v)))

(fn wgt* [prop ...]
  (wibox.widget (merge prop [...])))

{ : rrect
  : wgt*
  : merge
}

