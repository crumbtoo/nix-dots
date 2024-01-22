(pcall require :luarocks.loader)

(local naughty (require :naughty))

(naughty.connect_signal
  "request::display_error"
  (fn [message startup]
    (naughty.notification
      { :         message
        :title    (.. "Oops, an error happened" (or (and startup " during startup!") "!"))
        :urgency  :critical
      })))

(fn notify [text]
  (naughty.notify {:text text}))

(require :awful.autofocus)
(require :awful.hotkeys_popup.keys)
(require :theme)
(require :signal)
(require :binds)
(require :config.rules)	

