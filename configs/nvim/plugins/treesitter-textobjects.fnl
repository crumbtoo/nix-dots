((. (require :nvim-treesitter.configs) :setup)
  { :textobjects
      { :select
        { :enable false
          :lookahead true
          :keymaps
            { :af "@function.outer"
              :if "@function.inner"
            }
        }
      }
  })

