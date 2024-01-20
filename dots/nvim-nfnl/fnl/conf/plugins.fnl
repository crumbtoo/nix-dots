; (local packer (require :packer))
; (import-macros {: opts!
;                 : sparse} :lib/table)
; (import-macros {: do-req
;                 : let-req} :lib/require)
; 
; (packer.startup
;   (fn [use]
;     ;; general utilities
;     (use :wbthomason/packer.nvim)
;     ;; language utils
;     (use (opts! :nvim-treesitter/nvim-treesitter
;                 :config (require :conf.plugins.nvim-treesitter)))
;     (use (opts! :rktjmp/hotpot.nvim
;                 :branch :nightly))))
;   
