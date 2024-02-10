(local gears        (require :gears))
(local awful        (require :awful))
(local beautiful    (require :beautiful))
(local wibox        (require :wibox))
(local util         (require :lib.util))
(import-macros {: wgt : btn} :lib.macros)

(fn unit [])

(wgt
  { :widget wibox.widget.textbox
    :text :hi })

