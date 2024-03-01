(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

;------------------------------------------------------------------------------;
; ui

(set! splitright)

;; disable netrw in favour of nvim-tree
(set vim.g.loaded_netrw 1)
(set vim.g.loaded_netrwPlugin 1)

;; search case-insensitive, unless any capital letters are in the search
;; pattern. remember that patterns may use \c and \C to match case-sensitive or
;; case-insensitive, respectively.
(set! smartcase)
(set! ignorecase)

;; line numbers
(set! number)
(set! relativenumber)
(set! signcolumn :yes)

;; colours
(color! :kanagawa)

;------------------------------------------------------------------------------;
; formatting

;; whitespace
(set! tabstop 4)
(set! shiftwidth 4)
(set! softtabstop 4)
(set! expandtab)

;; formatting
(set! textwidth 80)
(set! formatoptions :jcrqlt) ; see: :h fo-table
(augroup! :ftpluginsFormatOverride
  [[Filetype] * "set formatoptions=jcrqlt"])

;------------------------------------------------------------------------------;

;; filetype
(exec!
  [filetype on]
  [filetype plugin indent on]
  [syntax on]
  [syntax enable])

;------------------------------------------------------------------------------;
; control
(set! timeoutlen 500) ; timeout multi-key commands after 500ms

;------------------------------------------------------------------------------;
; abbreviations

(exec!
  ; open help windows in a vertical split
  [cabbrev h vert bo h])

;------------------------------------------------------------------------------;

;; we have to define some syntax rules for vim-sexp to work properly.
;; by default, vim-sexp will completely ignore fennel strings and not treat
;; them as atoms. vim-sexp will also incorrectly match parens inside strings.

;; these syntax commands alone don't work for some fucking mysterious reason, so
;; we also wrap it in an autocmd

(augroup! :BullshitFTPluginSyntaxHack
  [[FileType] [fennel] 
    `(do (vim.cmd "syntax match string /:[^()\\[\\]\\{\\}\"'\\~\\@`,;]+/")
         (vim.cmd "syntax region string start=/\"/ skip=/\\\\\"/ end=/\"/"))])

