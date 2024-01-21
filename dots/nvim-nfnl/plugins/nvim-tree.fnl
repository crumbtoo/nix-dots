(fn []
  (let [p (require :nvim-tree)]
    (p.setup
      { :sort_by              :case_sensitive
        :view                 { :width 30
                                :number true
                                :relativenumber true }
        :renderer             { :group_empty true }
        :filters              { :dotfiles true }
        :update_focused_file  { :update_root true }
      })))

