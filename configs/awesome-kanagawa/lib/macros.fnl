(local fun    (require :lib.fun))
(local utils  (require :lib.util))

(fn rel-require [m]
  `(require (.. ... ("." .. ,m))))

(fn wgt [prop ...]
  (if (table? prop)
      (utils.merge prop [...])
      `(let [util# (require :lib.util)
             wibox# (require :wibox)]
         (wibox#.widget (util#.merge ,prop ,[...])))))

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
        :alt        :Mod1
        _           (assert-compile false
                      "unrecognised modifier name"
                      m)))

(fn unname-mods [ms]
  (collect [k m (pairs ms)]
    k (unname-mod m)))

(fn btn [mods m f]
  `(awful.button ,(unname-mods mods) ,(unname-btn m) ,f))

(fn btn* [[mods m f]]
  `(awful.button ,(unname-mods mods) ,(unname-btn m) ,f))

(fn key [opts]
  (let [{: mods : key : press : release : data } opts]
    `(awful.key ,(unname-mods mods) ,key ,press ,release ,data)))

(fn key* [[mods key press release data]]
  (let [data* (if (= (type data) :string) {:description data} data)]
    `(awful.key ,(unname-mods mods) ,key ,press ,release ,data*)))

; TODO: group syntax:
; (mk-client-mappings!
;   (group :client
;     [[:mod] :f (fn [] dotdotdot)])
;     [[] :w (fn [] dotdotdot)]
;   (group :tag
;     dotdotdot))

(fn mk-client-keys! [...]
  `(awful.keyboard.append_client_keybindings
     ,(->> [...]
           (fun.map key*)
           (fun.totable))))

(fn mk-client-buttons! [...]
  `(awful.mouse.append_client_mousebindings
     ,(->> [...]
           (fun.map btn*)
           (fun.totable))))

{ : rel-require
  : wgt
  : unname-btn
  : unname-mod
  : btn
  : mk-client-keys!
  : mk-client-buttons!
}

