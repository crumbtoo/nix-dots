(local theme-assets     (require :beautiful.theme_assets))
(local xresources       (require :beautiful.xresources))
(local shp              (require :gears.shape))
(local kana             (require :theme.kanagawa))
(local util             (require :lib.util))
(local gears            (require :gears))
(local beautiful        (require :beautiful))

(local dpi xresources.apply_dpi)

(local troot (.. (os.getenv :HOME) :/.config/awesome/theme))

(fn primary-font [size]
  (string.format "FiraMono Nerd Font %d" size))

(fn rel [path]
  (.. troot path))

(beautiful.init
  {
    ;; common
    :font             (primary-font 11)
    :text             kana.fuji-white
    :bg_normal        kana.sumi-ink2
    :bg_panel         kana.sumi-ink0
    :bg_focus         kana.old-white
    :bg_subtle_focus  :#ffffff31
    ; :bg_urgent        :#ff0000
    ; :bg_minimize      :#444444
    ; :bg_systray       theme.bg_normal
    ; :fg_normal        :#aaaaaa
    ; :fg_focus         :#ffffff
    ; :fg_urgent        :#ffffff
    ; :fg_minimize      :#ffffff
    :useless_gap      (dpi 4)
    :border_width     (dpi 2)
    :border_normal    kana.sumi-ink1
    :border_focus     kana.old-white
    ; :border_marked    :#91231c

    :wallpaper        (rel "/wallpaper.png")

    ;; wibar
    :wibar_shape      (util.rrect 20)
    :wibar_width      30
    :wibar_height     (dpi (* (/ 80 100) 1440))
    :wibar_margins    { :top    0
                        :bottom 0
                        :left   (dpi 8) ; adjust for useless_gap
                        :right  0 }
    ; :wibar_align      :centered
    ; :wibar_stretch    false

    ;; taglist
    :taglist_font                 (primary-font 18)
    ; :taglist_spacing              5
    ; :taglist_fg_focus             kana.old-white
    ; :taglist_fg_empty             :#00000000
    ; :taglist_fg_occupied          :#00000000
    :taglist_bg_focus             :#00000000
    ; :taglist_bg_empty             kana.sumi-ink4
    ; :taglist_bg_occupied          kana.sumi-ink4
    ; :taglist_bg_focus             kana.fuji-gray
    ; :taglist_bg_urgent            kana.samurai-red
    :taglist_shape                gears.shape.circle
    ; :tag_icon_empty               (rel :icons/tag-diring.svg)
    :tag_icon_empty               "⊚"
    :tag_icon_occ                 "⊙"
    :tag_icon_focus               "⊗"
    :tag_icon_focus_opacity       1
    :tag_icon_unfocus_opacity     0.5

    ;; tasklist
    :tasklist_bg_normal           :#00000000
    :tasklist_bg_focus            kana.old-white
    :tasklist_shape_focus         (util.rrect 6)

    ;; menu
    :menu_font      (primary-font 8)

    ;; empanel
    :empanel_radius   8
    :empanel_margins  (let [ x 0
                             y 8 ]
                      { :top    y
                        :bottom y
                        :left   x
                        :right  x })

    ;; textclock
    :textclock_font (primary-font 12)
  })

