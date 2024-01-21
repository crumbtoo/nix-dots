(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

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

