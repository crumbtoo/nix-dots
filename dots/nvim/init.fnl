(local lazy (require :lazy))

(lazy.setup
  (require :plugins)
  { :performance {
      :reset_packpath false
    }
  })

(require :binds)
(require :plugconfs)
(require :settings)

