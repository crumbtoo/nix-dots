(local ls (require :luasnip))
(local t ls.text_node)
(local i ls.insert_node)
(local d ls.dynamic_node)
(local fmta (. (require :luasnip.extras.fmt) :fmta))
(import-macros {: s : s*} :lib.snippet-macros)

[ (s :lang
     "{-# LANGUAGE <...> #-}"
     (fmta "{-# LANGUAGE <> #-}"
           [(i 1)]))
  (s :imc
     "import Control.<...>"
     (fmta "import Control.<>"
           [(i 1)]))
  (s :imd
     "import Data.<...>"
     (fmta "import Data.<>"
           [(i 1)]))
  (s :cabal
     "cabal scratch file header"
     (fmta "{- cabal:\nbuild-depends: <>\ndefault-language: GHC2021\n-}"
           [(i 1)]))
  (s :haddock
     "haddock module header"
     (fmta "{-|
Module      : <>
Description : <>
<>
-}\n"
           [(i 1) (i 2) (i 3)]))
  (s :module
     "module header"
     (fmta "module <>
    (
    )
    where\n"
           [(i 1)]))
  (s :prag
     "pragma"
     (fmta "{-# <> #-}"
           [(i 1)]))
]

