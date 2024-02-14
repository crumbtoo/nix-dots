(fn all [p l]
  (match l
    [a & as] (if (p a) (all p as) false)
    []       true))

(fn merge [...]
  (accumulate [merged { }
               _ t (pairs [...])]
    (collect [k v (pairs t) &into merged]
      k v)))

{ : merge
  : all
}

