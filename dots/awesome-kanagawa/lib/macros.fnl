(local fun (require "lib.fun"))

(fn rel-require [m]
  `(require (.. ... ("." .. ,m))))

(fn merge [t u]
  (let [tbl { }]
    (each [k v (pairs t)] (tset tbl k v))
    (each [k v (pairs u)] (tset tbl k v))
    tbl))

(fn wgt [prop ...]
  (merge prop [...]))

(fn unname-btn [m]
  (case m
        :lmb        1
        :rmb        3
        :mmb        2
        :mwheelup   4
        :mwheeldown 5
        _           (assert-compile false
                      "unrecognised mouse button name"
                      m)))

(fn unname-mod [m]
  (case m
        :shift      :Shift
        :ctrl       :Control
        :mod        :Mod4
        _           (assert-compile false
                      "unrecognised modifier name"
                      m)))

(fn unname-mods [ms]
  (collect [k m (pairs ms)]
    k (unname-mod m)))

(fn btn [mods m f]
  `(awful.button ,(unname-mods mods) ,(unname-btn m) ,f))

{ : rel-require
  : wgt
  : unname-btn
  : unname-mod
  : btn
}

