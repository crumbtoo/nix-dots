(local wezterm          (require :wezterm))

{ ;;; appearance
  :colors   (require :kanagawa)
  :enable_tab_bar false
  :force_reverse_video_cursor true

  ;; cursor
  :default_cursor_style "BlinkingUnderline"

  ;; font
  :font (wezterm.font "Victor Mono" {  })
  :font_size 11

  ;;; behaviour
  :audible_bell "Disabled"
}

