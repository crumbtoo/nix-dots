(let [lazy (require :lazy)]
  (lazy.setup (require :plugins)
              { :performance
                  { :reset_packpath false
                  }
              }))

; TODO: include seems to slow down opening nvim, but avoids the issues with
; require
(include :binds)
(include :settings)
; (require :binds)
; (require :settings)

(let [p (require :nvim-treesitter.configs)]
  (p.setup
    { :ensure_installed [ :haskell :fennel ]
      :highlight
        { :enable true
        }
    }))

