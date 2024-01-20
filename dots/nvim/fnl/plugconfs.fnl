(macro setup [plugin arg]
  (let [p (require plugin)]
    (p.setup arg)))

(macro with-plug [[binder plugin] & body]
  `(let [,binder (require ,plugin)]
     ,(unpack body)))

(with-plug [p :leap]
 (p.create_default_mappings))

(with-plug [p :nvim-treesitter.configs]
  (p.setup
    { :highlight
        { :enable true
        }
    }))

