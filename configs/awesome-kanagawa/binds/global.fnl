(local awful        (require :awful))
(local mymainmenu   (require :ui.mainmenu))
(local fun          (require :lib.fun))

(local modifiers {:mod   "Mod4"
                  :shift "Shift"
                  :ctrl  "Control"})

(fn map-mods [mods]
  (->> mods
       (fun.map (partial . modifiers))
       (fun.totable)))

(fn btn [mods btn-code fun]
  (awful.button (map-mods mods) btn-code fun))

