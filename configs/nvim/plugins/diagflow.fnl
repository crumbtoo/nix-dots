{ :border_chars
    { :bottom_left "└"
      :bottom_right "┘"
      :horizontal "─"
      :top_left "┌"
      :top_right "┐"
      :vertical "│" }
  :enable true
  :format #$.message
  :gap_size 1
  :inline_padding_left 0
  :max_height 10
  :max_width 60
  :padding_right 0
  :padding_top 0
  :placement :top
  :render_event [ :DiagnosticChanged
                  :CursorMoved ]
  :scope :cursor
  :severity_colors
    { :error :DiagnosticFloatingError
      :hint :DiagnosticFloatingHint
      :info :DiagnosticFloatingInfo
      :warning :DiagnosticFloatingWarn }
  :show_borders true
  :show_sign false
  :text_align :right
  :toggle_event [ :InsertEnter :InsertLeave ]
  :update_event [ :DiagnosticChanged
                  :BufReadPost ]
}	
