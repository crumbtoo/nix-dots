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
        :alt        :Mod1
        _           (assert-compile false
                      "unrecognised modifier name"
                      m)))

(fn unname-mods [ms]
  (collect [k m (pairs ms)]
    k (unname-mod m)))

(fn btn [mods m f]
  `(awful.button ,(unname-mods mods) ,(unname-btn m) ,f))

(fn key [opts]
  (let [{: mods : key : press : release : data } opts]
    `(awful.key ,(unname-mods mods) ,key ,press ,release ,data)))

(fn key* [[mods key press release data]]
  `(awful.key ,(unname-mods mods) ,key ,press ,release ,data))

; TODO: group syntax:
; (mk-client-mappings!
;   (group :client
;     [[:mod] :f (fn [] dotdotdot)])
;     [[] :w (fn [] dotdotdot)]
;   (group :tag
;     dotdotdot))

(fn mk-client-mappings! [...]
  `(awful.keyboard.append_client_keybindings
     ,(->> [...]
           (fun.map key*)
           (fun.totable))))

; (fn modify [x f]
;   `(set ,x (,f ,x)))

{ : rel-require
  : wgt
  : unname-btn
  : unname-mod
  : btn
  : mk-client-mappings!
  ; : modify
}

