(fn []
  (let [ p (require :startup) ]
    (p.setup
      { :hydra-header
          { :type             :text
            :align            :center
            :fold_section     false
            :title            :Header
            :margin           5
            :content          (. (require :startup.headers) :hydra_header)
            :highlight        :Statement
            :oldfiles_amount  0
          }
        :quote-header
          { :align              :center
            :default_color      ""
            :fold_section       false
            :highlight          :Constant
            :margin             5
            :oldfiles_amount    0
            :oldfiles_directory false
            :title              :Quote
            :type               :text
            :content ((. (require :startup.functions) :quote))
          }
        :command-palette
          { :type           :mapping
            :content     
              [ [ "New File"        "enew"                    "e" ]
                [ " Find File"     "Telescope find_files"    "<leader>ff" ]
                [ "󰍉 Grep Files"    "Telescope live_greps"    "<leader>lg" ]
                [ " File Browser"  "Telescope file_browser"  "<leader>fb" ]
              ]
            :align          :center
            :fold_section   false
            :margin         5
            :title          "Command Palette"
            :highlight      :String
          }
        :clock
          { :align              :center
            :default_color      :#FFFFFF
            :fold_section       false
            :highlight          :TSString
            :margin             5
            :oldfiles_amount    10
            :oldfiles_directory false
            :title              ""
            :type               :text
            :content (fn []
                       (local clock (.. " " (os.date "%H:%M")))
                       (local date (.. " " (os.date "%d-%m-%y")))
                       [clock date])
          }
;------------------------------------------------------------------------------;
        :colors   { :background "#1f2227"
                    :folded_section "#56b6c2"
                  }
        :mappings { :execute_command :<CR>
                    :open_file :o
                    :open_file_split :<c-o>
                    :open_help "?"
                    :open_section :<TAB>
                  }
        :options  { :cursor_column 0.5
                    :disable_statuslines true
                    :empty_lines_between_mappings true
                    :mapping_keys true
                    :paddings [1 2 2 2]
                  }
        :parts    [ :hydra-header :quote-header :command-palette :clock ]
      })))

