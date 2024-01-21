(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)
(local utils (require :lib.utils))

(set vim.g.mapleader " ")
(set vim.g.maplocalleader "  ")

(map! [n :silent] :<space> ::nohl<CR>
      "hide highlighted text")

(map! [ic] :jk :<Esc>
      "escape")
(map! [ic] :kj :<Esc>
      "escape")

(augroup! :termesc
  [[TermOpen] term://* "tnoremap <buffer> jk <C-\\><C-n>"]
  [[TermOpen] term://* "tnoremap <buffer> kj <C-\\><C-n>"])

;;; ui

;; files
(map! [n :silent] :<leader>n
      ":NvimTreeToggle<CR>"
      "toggle nvim-tree")

(map! [n :silent] :<leader>ff
      ":Telescope find_files<CR>"
      "search files")

;; toggleterm
(map! [n :silent] :<leader>t "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>"
      "toggle shell window")

(map! [n :silent] :<leader>G
      (let [term (. (require :toggleterm.terminal) :Terminal)
            lazygit (term:new { :cmd          "lazygit"
                                :hidden       true
                                :dir          :git_dir
                                :direction    :float
                                :float_opts   { :border :curved }
                                :on_create
                                  (fn []
                                    (vim.keymap.del :t :jk {:buffer 0})
                                    (vim.keymap.del :t :kj {:buffer 0}))
                              })]
        (fn [] (lazygit:toggle)))
      "toggle lazygit window")

;;; vim-fu

(map! [n :silent] :<C-i>
      (fn []
        (let [ln (vim.fn.line ".")]
          (vim.fn.append ln vim.b.rulestring)
          (vim.api.nvim_feedkeys "0j" "n" true)))
      "insert rule comment")

(map! [n :silent] :<leader>w
      (fn []
        ((. (require :nvim-window) :pick)))
      "view jump to window options")

