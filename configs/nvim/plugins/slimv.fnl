(require-macros :hibiscus.vim)

(require-macros :hibiscus.core)

(g! paredit_mode 0)
; (g! lisp_rainbow 1)

; inoremap <buffer> <expr>   (            PareditInsertOpening('(',')')
;     inoremap <buffer> <silent> )            <C-R>=PareditInsertClosing('(',')')<CR>
;     inoremap <buffer> <expr>   "            PareditInsertQuotes()
;     inoremap <buffer> <expr>   <BS>         PareditBackspace(0)
;     inoremap <buffer> <expr>   <C-h>        PareditBackspace(0)
;     inoremap <buffer> <expr>   <Del>        PareditDel()
;     if b:balancing_all_brackets && g:paredit_smartjump
;         noremap  <buffer> <silent> (            :<C-U>call PareditSmartJumpOpening(0)<CR>
;         noremap  <buffer> <silent> )            :<C-U>call PareditSmartJumpClosing(0)<CR>
;         vnoremap <buffer> <silent> (            <Esc>:<C-U>call PareditSmartJumpOpening(1)<CR>
;         vnoremap <buffer> <silent> )            <Esc>:<C-U>call PareditSmartJumpClosing(1)<CR>
;     else
;         noremap  <buffer> <silent> (            :<C-U>call PareditJumpOpening('(',')',0)<CR>
;         noremap  <buffer> <silent> )            :<C-U>call PareditJumpClosing('(',')',0)<CR>
;         vnoremap <buffer> <silent> (            <Esc>:<C-U>call PareditJumpOpening('(',')',1)<CR>
;         vnoremap <buffer> <silent> )            <Esc>:<C-U>call PareditJumpClosing('(',')',1)<CR>
;     endif
;     noremap  <buffer> <silent> [[           :<C-U>call PareditFindDefunBck()<CR>
;     noremap  <buffer> <silent> ]]           :<C-U>call PareditFindDefunFwd()<CR>

;     call RepeatableNNoRemap('x', ':<C-U>call PareditEraseFwd()')
;     nnoremap <buffer> <silent> <Del>        :<C-U>call PareditEraseFwd()<CR>
;     call RepeatableNNoRemap('X', ':<C-U>call PareditEraseBck()')
;     nnoremap <buffer> <silent> s            :<C-U>call PareditEraseFwd()<CR>i
;     call RepeatableNNoRemap('D', 'v$:<C-U>call PareditDelete(visualmode(),1)')
;     nnoremap <buffer> <silent> C            v$:<C-U>call PareditChange(visualmode(),1)<CR>
;     nnoremap <buffer> <silent> d            :<C-U>call PareditSetDelete(v:count)<CR>g@
;     vnoremap <buffer> <silent> d            :<C-U>call PareditDelete(visualmode(),1)<CR>
;     vnoremap <buffer> <silent> x            :<C-U>call PareditDelete(visualmode(),1)<CR>
;     vnoremap <buffer> <silent> <Del>        :<C-U>call PareditDelete(visualmode(),1)<CR>
;     nnoremap <buffer> <silent> c            :set opfunc=PareditChange<CR>g@
;     vnoremap <buffer> <silent> c            :<C-U>call PareditChange(visualmode(),1)<CR>
;     call RepeatableNNoRemap('dd', ':<C-U>call PareditDeleteLines()')
;     nnoremap <buffer> <silent> cc           :<C-U>call PareditChangeLines()<CR>
;     nnoremap <buffer> <silent> cw           :<C-U>call PareditChangeSpec('cw',1)<CR>
;     nnoremap <buffer> <silent> cW           :set opfunc=PareditChange<CR>g@E
;     nnoremap <buffer> <silent> cb           :<C-U>call PareditChangeSpec('cb',0)<CR>
;     nnoremap <buffer> <silent> ciw          :<C-U>call PareditChangeSpec('ciw',1)<CR>
;     nnoremap <buffer> <silent> caw          :<C-U>call PareditChangeSpec('caw',1)<CR>
;     nnoremap <buffer> <silent> do           do
;     nnoremap <buffer> <silent> dp           dp
;     call RepeatableNNoRemap('p', ':<C-U>call PareditPut("p")')
;     call RepeatableNNoRemap('P', ':<C-U>call PareditPut("P")')
;     call RepeatableNNoRemap(g:paredit_leader . 'w(', ':<C-U>call PareditWrap("(",")")')
;     execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w(  :<C-U>call PareditWrapSelection("(",")")<CR>'
;     call RepeatableNNoRemap(g:paredit_leader . 'w"', ':<C-U>call PareditWrap('."'".'"'."','".'"'."')")
;     execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w"  :<C-U>call PareditWrapSelection('."'".'"'."','".'"'."')<CR>"
;     " Splice s-expression killing backward/forward
;     execute 'nmap     <buffer> <silent> ' . g:paredit_leader.'<Up>    d[(:<C-U>call PareditSplice()<CR>'
;     execute 'nmap     <buffer> <silent> ' . g:paredit_leader.'<Down>  d])%:<C-U>call PareditSplice()<CR>'
;     call RepeatableNNoRemap(g:paredit_leader . 'I', ':<C-U>call PareditRaise()')
;     if b:balancing_all_brackets
;         inoremap <buffer> <expr>   [            PareditInsertOpening('[',']')
;         inoremap <buffer> <silent> ]            <C-R>=PareditInsertClosing('[',']')<CR>
;         inoremap <buffer> <expr>   {            PareditInsertOpening('{','}')
;         inoremap <buffer> <silent> }            <C-R>=PareditInsertClosing('{','}')<CR>
;         call RepeatableNNoRemap(g:paredit_leader . 'w[', ':<C-U>call PareditWrap("[","]")')
;         execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w[  :<C-U>call PareditWrapSelection("[","]")<CR>'
;         call RepeatableNNoRemap(g:paredit_leader . 'w{', ':<C-U>call PareditWrap("{","}")')
;         execute 'vnoremap <buffer> <silent> ' . g:paredit_leader.'w{  :<C-U>call PareditWrapSelection("{","}")<CR>'


