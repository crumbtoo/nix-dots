(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

;;; ui
(set! splitright)
;; disable netrw in favour of nvim-tree
(set vim.g.loaded_netrw 1)
(set vim.g.loaded_netrwPlugin 1)

;;; colours
(color! :kanagawa)

;;; whitespace
(set! tabstop 4)
(set! shiftwidth 4)
(set! softtabstop 4)
(set! expandtab)

;;; line numbers
(set! number)
(set! relativenumber)
(set! signcolumn :yes)

;;; formatting
(set! textwidth 80)
(set! formatoptions :jcrqlt) ; see: :h fo-table
(augroup! :ftpluginsFormatOverride
  [[Filetype] * "set formatoptions=jcrqlt"])

;;; filetype
(exec!
  [filetype on]
  [filetype plugin on])

;;; control
(set! timeoutlen 500) ; timeout multi-key commands after 500ms

