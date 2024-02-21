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
  ; (opts :julienvincent/nvim-paredit
  ;       :config (require :plugins.nvim-paredit))
  ; (opts :julienvincent/nvim-paredit-fennel
  ;       :dependencies [ :julienvincent/nvim-paredit ]
  ;       :ft [ :fennel ]
  ;       :config #(: (require :nvim-paredit-fennel) :setup))
  ; (opts :Olical/conjure
  ;       :init (fn []
  ;               (tset vim.g "conjure#filetype#fennel" :conjure.client.fennel.stdio)))
  (opts :jaawerth/fennel.vim)
  (opts :Vigemus/iron.nvim
        :config #(require :plugins.iron))
  (opts :sudormrfbin/cheatsheet.nvim
        :main :cheatsheet
        :opts (require :plugins.cheatsheet))
  :junegunn/vim-easy-align
  (opts :lervag/vimtex
        :config #(require :plugins.vimtex))
  (opts :nvim-treesitter/nvim-treesitter-textobjects
        :dependencies [ :nvim-treesitter/nvim-treesitter ]
        :config #(require :plugins.treesitter-textobjects))
  (opts :dgagn/diagflow.nvim
        :event :LspAttach
        :opts (require :plugins.diagflow))
  ;; haskell
  (opts :luc-tielen/telescope_hoogle
        :dependencies [ :nvim-telescope/telescope.nvim ]
        :config #((. (require :telescope) :load_extension) :hoogle))
  (opts :MrcJkb/haskell-tools.nvim)
  ;; lisp
  (opts :guns/vim-sexp
        :init (fn []
                (g! vim.g.sexp_filetypes "fennel,lisp,clojure,scheme"))
        :config (fn []
                  (fn vim-sexp-mappings []
                    ;; word maps
                    (map! [nxo] :B "<Plug>(sexp_move_to_prev_element_head)"
                          "move to prev element head")
                    (map! [nxo] :W "<Plug>(sexp_move_to_next_element_head)"
                          "move to next element head")
                    (map! [nxo] :gE "<Plug>(sexp_move_to_prev_element_tail)"
                          "move to prev element tail")
                    (map! [nxo] :E "<Plug>(sexp_move_to_next_element_tail)"
                          "move to next element tail")
                    ;; insert
                    (map! [n] :<I "<Plug>(sexp_insert_at_list_head)"
                          "insert at list head")
                    (map! [n] :>I "<Plug>(sexp_insert_at_list_tail)"
                          "insert at list tail")
                    ;; move/swap
                    (map! [n] :<f "<Plug>(sexp_swap_list_backward)"
                          "swap form backwards")
                    (map! [n] :>f "<Plug>(sexp_swap_list_forward)"
                          "swap form backwards")
                    (map! [n] :<e "<Plug>(sexp_swap_element_backward)"
                          "swap atom backwards")
                    (map! [n] :>e "<Plug>(sexp_swap_element_forward)"
                          "swap atom forward")
                    ;; slurp/barf
                    (map! [n] ">(" "<Plug>(sexp_emit_head_element)"
                          "barf forwards")
                    (map! [n] "<)" "<Plug>(sexp_emit_tail_element)"
                          "barf backwards")
                    (map! [n] ">)" "<Plug>(sexp_capture_prev_element)"
                          "slurp forwards")
                    (map! [n] "<(" "<Plug>(sexp_capture_next_element)"
                          "slurp backwards"))
                    (augroup! :vim_sexp_mapping
                      [[FileType] [fennel lisp clojure scheme]
                                  `vim-sexp-mappings])))
  ; (opts :tpope/vim-sexp-mappings-for-regular-people
  ;       :priority 50)
  ;; agda
  ; :msuperdock/vim-agda

  ;;; vim-fu
  (opts :windwp/nvim-autopairs
        :config #(require :plugins.autopairs))
  ; :jiangmiao/auto-pairs
  :ggandor/leap.nvim
  (opts :kylechui/nvim-surround
        :config true)
  :tpope/vim-commentary
  (opts :L3MON4D3/LuaSnip
        ; :build "make install_jsregexp"
        :version :v2.2
        :config
          (fn []
            (let [ls (require :luasnip.loaders.from_lua)
                  data (.. (vim.fn.stdpath :data) :/luatarget/snippets)]
              (ls.load { :paths data }))))
  ;;; misc
  :tpope/vim-fugitive
]

