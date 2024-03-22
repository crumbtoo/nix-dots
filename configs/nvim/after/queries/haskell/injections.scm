;; inherits: haskell
;; extends

(quasiquote
  (quoter) @_name
  (#eq? @_name "jmacro")
  (quasiquote_body) @injection.content
  (#set! injection.language "javascript"))

(quasiquote
  (quoter) @_name
  (#eq? @_name "core")
  (quasiquote_body) @injection.content
  (#set! injection.language "haskell"))

