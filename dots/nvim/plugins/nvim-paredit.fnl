(fn []
  (let [p (require :nvim-paredit)]
    (p.setup
      { :filetype [ :fennel ]
        :use_default_keys true
        :indent { :enabled true }
      })))

