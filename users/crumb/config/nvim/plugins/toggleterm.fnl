(fn []
  ((. (require :toggleterm) :setup)
    { :size                 10
      :shell                vim.o.shell
      :persist_size         false
      :terminal_mappings    true
      :start_in_insert      true
    }))

