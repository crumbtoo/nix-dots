(local awful        (require :awful))
(local mymainmenu   (require :ui.mainmenu))
(local fun          (require :lib.fun))
(import-macros {: mk-global-keys!} :lib.macros)

(local *rofi-dir* (.. (os.getenv :HOME) :/.config/rofi/launchers/type-3))
(local *rofi-cmd* (string.format "rofi -show drun -theme %s/style-3.rasi"
                                  *rofi-dir*))
(local *terminal-cmd* "wezterm")

(mk-global-keys!
  {:modifiers [:Mod4] :keygroup awful.key.keygroup.NUMROW
   :on_press (fn [i] (let [screen (awful.screen.focused)
                           tag (. screen :tags i)]
                       (when tag (tag:view_only)))) }
  [[:mod] :d #(awful.spawn *rofi-cmd*)]
  [[:alt :shift] :t #(awful.spawn *terminal-cmd*)])

