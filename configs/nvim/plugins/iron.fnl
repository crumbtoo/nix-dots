(local haskell-repl-cmd
  (fn [meta]
    (let [file (vim.api.nvim_buf_get_name meta.current_bufnr)]
      ((. (require :haskell-tools) :repl :mk_repl_cmd) file))))

((. (require :iron.core) :setup)
  { :config
      { :repl_definition
          { :haskell
              { :command haskell-repl-cmd }
            :happy
              { :command haskell-repl-cmd }
            :alex
              { :command haskell-repl-cmd }
          }
        :repl_open_cmd ((. (require :iron.view) :split :botright) 12)
      }
    :scratch_repl true
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
        ; :send_file :<space>sf
        :send_line :<space>sl
        :send_mark :<space>sm
        :send_motion :<space>sc
        :send_until_cursor :<space>su
        ; :visual_send :<space>sc
      }
  })

