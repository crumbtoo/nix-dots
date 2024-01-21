(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

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

