(local awful      (require :awful))
(import-macros {: mk-client-keys!
                : mk-client-buttons!} :lib.macros)

;; key binds

(client.connect_signal :request::default_keybindings
  (fn []
    (mk-client-keys!
      [[ :mod ] :f #(doto $ (tset :fullscreen (not $.fullscreen))
                            (: :raise))]
      )))

;; sloppy focus

(client.connect_signal :mouse::enter
  (fn [c]
    (c:activate { :context :mouse_enter
                  :raise   false })))

;; mouse binds

(macro activate [ctx act]
  `(fn [c#]
     (: c# :activate { :context ,ctx
                       :action  ,act })))

(client.connect_signal :request::default_mousebindings
  (fn [c]
    (mk-client-buttons!
      [[]     :lmb (activate :mouse_click)]
      [[:mod] :lmb (activate :mouse_click :mouse_move)]
      [[:mod] :rmb (activate :mouse_click :mouse_resize)])))

