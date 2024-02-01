(fn []
  ((. (require :iron.core) :setup)
    { :config
        { :repl_definition
            { :sh
                { :command [:zsh]
                }
              :haskell
                { :command
                    (fn [meta]
                      (let [filename (vim.api.nvim_buf_get_name
                                       meta.current_bufnr)]
                        [:cabal :v2-repl filename]))
                }
              :fennel
                { :command [:fennel]
                }
            }
          :repl_open_cmd ((. (require :iron.view) :bottom) 15)
          :scratch_repl true
        }
      :highlight {:italic true}
      :ignore_blank_lines true
      :keymaps
        { :clear :<space>cl
          :cr :<space>s<cr>
          :exit :<space>sq
          :interrupt :<space>s<space>
          :mark_motion :<space>mc
          :mark_visual :<space>mc
          :remove_mark :<space>md
          :send_file :<space>sf
          :send_line :<space>sl
          :send_mark :<space>sm
          :send_motion :<space>sc
          :send_until_cursor :<space>su
          :visual_send :<space>sc
        }
    }))

