(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

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

  ;;; themes / ui
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
  (opts :lukas-reineke/indent-blankline.nvim
        :main :ibl
        :opts { :scope {:enabled false} })

  ;;; language tools
  (opts :nvim-treesitter/nvim-treesitter
        :config #(require :plugins.treesitter))
  (opts :jaawerth/fennel.vim)
  (opts :Vigemus/iron.nvim
        :config #(require :plugins.iron))
  (opts :sudormrfbin/cheatsheet.nvim
        :main :cheatsheet
        :opts (require :plugins.cheatsheet))
  (opts :junegunn/vim-easy-align
        :config #(require :plugins.easy-align))
  (opts :lervag/vimtex
        :config #(require :plugins.vimtex))
  (opts :nvim-treesitter/nvim-treesitter-textobjects
        :dependencies [ :nvim-treesitter/nvim-treesitter ]
        :config #(require :plugins.treesitter-textobjects))
  (opts :crumbtoo/diagflow.nvim ; :dgagn/diagflow.nvim
        :event :LspAttach
        :opts (require :plugins.diagflow))
  ;; haskell
  (opts :luc-tielen/telescope_hoogle
        :dependencies [ :nvim-telescope/telescope.nvim ]
        :config #((. (require :telescope) :load_extension) :hoogle))
  (opts :MrcJkb/haskell-tools.nvim)
  ;; lisp
  (opts :guns/vim-sexp
        :init #(g! sexp_filetypes "")
        :config #(require :plugins.vim-sexp))
  (opts :Olical/conjure
        :init (fn []
                (g! conjure#mapping#prefix "'")
                ; (g! conjure#filetype#haskell :conjure.client.haskell.stdio)
                (g! conjure#client#scheme#stdio#command "csi -quiet -:c")
                (g! conjure#client#scheme#stdio#prompt_pattern "\n-#;%d-> ")))
  (opts :kovisoft/slimv
        :config #(require :plugins.slimv)
        :lazy false
        ; load before nvim-autopairs
        :priority 60)
  ;; agda
  ; :msuperdock/vim-agda
  ;; markdown
  ; (opts :iamcco/markdown-preview.nvim
  ;       :cmd [:MarkdownPreviewToggle :MarkdownPreview :MarkdownPreviewStop]
  ;       :ft [:markdown]
  ;       :build #((. vim.fn :mkdp#util#install))
  ;       :init (fn []
  ;               (g! mkdp_refresh_slow 1)))

  ;;; vim-fu
  (opts :windwp/nvim-autopairs
        :config #(require :plugins.autopairs))
  ; (opts :jiangmiao/auto-pairs
  ;       :config #(require :plugins.auto-pairs))
  :andymass/vim-matchup
  :ggandor/leap.nvim
  (opts :kylechui/nvim-surround
        :config true)
  :tpope/vim-commentary
  (opts :L3MON4D3/LuaSnip
        ; :build "make install_jsregexp"
        :opts
          { :link_roots false
            :keep_roots false
          }
        :version :v2.2
        :config
          (fn []
            (let [ls (require :luasnip.loaders.from_lua)
                  data (.. (vim.fn.stdpath :data) :/luatarget/snippets)]
              (ls.load { :paths data }))))
  ;;; misc
  :tpope/vim-fugitive
  :dbakker/vim-paragraph-motion
]

