(local awful      (require :awful))
(import-macros {: mk-client-mappings!} :lib.macros)

(client.connect_signal :request::default_keybindings
  (fn []
    (mk-client-mappings!
      [[ :mod ] :f #(doto $ (tset :fullscreen (not $.fullscreen))
                            (: :raise))]
      )))

;; sloppy focus

(client.connect_signal :mouse::enter
  (fn [c]
    (c:activate { :context :mouse_enter
                  :raise   false })))

