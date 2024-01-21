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
  (opts :nvim-lualine/lualine.nvim
        :config (require :plugins.lualine))
  (opts :startup-nvim/startup.nvim
        :config (require :plugins.startup-nvim)
        :dependencies [ :nvim-telescope/telescope.nvim
                        :nvim-lua/plenary.nvim])
  :https://gitlab.com/yorickpeterse/nvim-window.git
  (opts :akinsho/toggleterm.nvim
        :config (require :plugins.toggleterm))
  (opts :nvim-tree/nvim-tree.lua
        :config (require :plugins.nvim-tree))
  (opts :Vigemus/iron.nvim
        :config (require :plugins.iron))
  (opts :lukas-reineke/indent-blankline.nvim
        :main :ibl
        :opts { :scope {:enabled false}})

  ;; language tools
  :nvim-treesitter/nvim-treesitter

  ;; vim-fu
  :jiangmiao/auto-pairs
  (opts :ggandor/leap.nvim
        :config (with-plug [p :leap] (p.create_default_mappings)))
  (opts :kylechui/nvim-surround
        :config true)
  :tpope/vim-commentary]


