(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)
(local utils (require :lib.utils))

(set vim.g.mapleader " ")
(set vim.g.maplocalleader "  ")

(map! [n :verbose] :<C-\> "/\\<\\><Left><Left>"
      "search \\<word\\>")

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

(map! [n] :<leader>?
      ":<C-U>Cheatsheet<CR>"
      "view cheatsheet in telescope")

(map! [n] :<localleader>?
      ":<C-U>Cheatsheet!<CR>"
      "edit cheatsheet")

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

;; iron.nvim
(map! [n] :<leader>rr
      :<cmd>IronRepl<CR>
      "toggle iron repl")
(map! [n] :<leader>R
      "<cmd>IronSend :r<CR>"
      "reload iron repl")
(map! [n] :<leader>rf
      "<cmd>IronFocus<CR>"
      "focus iron repl")
(map! [v] :<leader>sc
      (fn []
        (let [core (require :iron.core)]
          (do (core.send nil ":{")
              (core.visual_send)
              (core.send nil ":}"))))
      "send visual selection to repl")

;; telescope
(map! [n] :<leader>H
      ":Telescope hoogle<CR>"
      "search hoogle")

;;; language tools
(map! [n] :K
      #(vim.lsp.buf.hover)
      "lsp hover")

;;; vim-fu

(map! [n :silent] :<leader><C-i>
      (fn []
        (let [ln (vim.fn.line ".")]
          (vim.fn.append ln vim.b.rulestring)
          (vim.api.nvim_feedkeys :0j :n true)))
      "insert hrule comment")

(map! [n :silent] :<leader>w
      (fn []
        ((. (require :nvim-window) :pick)))
      "view jump to window options")

(map! [nxo] :#
      :<Plug>Commentary
      "comment <motion>")

(map! [n] :##
      :<Plug>CommentaryLine
      "comment current line")

(map! [xn] :ga
      "<Plug>(EasyAlign)"
      "start easy-align command")

;; luasnip
(let [ls (require :luasnip)
      t  #(vim.api.nvim_feedkeys
            (vim.api.nvim_replace_termcodes $ true true true)
            :n
            false)]
     (map! [i :silent] :<Tab>
           (fn []
             (if (ls.expand_or_jumpable)
                 (ls.expand_or_jump)
                 (t :<Tab>)))
           "expand or jump to snippet")
     (map! [s :silent] :<Tab>
           (fn []
             (if (ls.jumpable 1)
                 (ls.jump 1)
                 (t :<Tab>)))
           "jump to next snippet")
     (map! [si :silent] :<S-Tab>
           (fn []
             (if (ls.jumpable -1)
                 (ls.jump -1)
                 (t :<S-Tab>)))
           "jump to previous snippet")
     (map! [si :silent] :<C-n>
           (fn []
             (if (ls.choice_active)
                 (ls.change_choice 1)
                 (t :<C-n>)))
           "next choice")
     (map! [si :silent] :<C-S-n>
           (fn []
             (if (ls.choice_active)
                 (ls.change_choice -1)
                 (t :<C-S-n>)))
           "previous choice"))

;; leap.nvim
(map! [n] :s
      "<Plug>(leap-forward)"
      "leap forward")
(map! [n] :S
      "<Plug>(leap-backward)"
      "leap backward")
(map! [n] :gs
      "<Plug>(leap-from-window)"
      "leap into window")

