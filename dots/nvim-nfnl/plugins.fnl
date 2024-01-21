(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(macro sparse [...]
  (let [args [...]
        t {}]
    (var j 0)
    (each [i x (ipairs args) :until (= x '&)]
      (set j i)
      (table.insert t x))
    (for [i (+ j 2) (length args) 2]
      (tset t (. args i) (. args (+ i 1))))
    t))

(macro opts [subject ...]
  `(sparse ,subject & ,...))

(macro with-plug [[binder plugin] & body]
  `(fn []
     (let [,binder (require ,plugin)]
       ,(unpack body))))

[ :udayvir-singh/tangerine.nvim ; fennel

  ;; themes / ui
  :rebelot/kanagawa.nvim
  :nvim-lualine/lualine.nvim
  (opts :startup-nvim/startup.nvim
        :config (require :plugins.startup-nvim)
        :dependencies [ :nvim-telescope/telescope.nvim
                        :nvim-lua/plenary.nvim ])

  ;; language tools
  :nvim-treesitter/nvim-treesitter

  ;; vim-fu
  :jiangmiao/auto-pairs
  (opts :ggandor/leap.nvim
        :config (with-plug [p :leap] (p.create_default_mappings)))
  (opts :kylechui/nvim-surround
        :config true)
]

