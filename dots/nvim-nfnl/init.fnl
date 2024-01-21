(let [lazy (require :lazy)]
  (lazy.setup (require :plugins)
              { :performance
                  { :reset_packpath false
                  }
              }))

(require :binds)
(require :settings)

(let [p (require :nvim-treesitter.configs)]
  (p.setup
    { :ensure_installed [ :fennel ]
      :highlight
        { :enable true
        }
    }))

