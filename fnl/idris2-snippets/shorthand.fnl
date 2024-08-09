(local {: s
        : sn
        : i
        : d
        : c
        : t}
  (require :idris2-snippets.internal.snippets))
(local util (require :idris2-snippets.internal.util))
;------------------------------------------------------------------------------;

(local shorthand {:all []})

;; this could/should probably be a function
(macro def-snippet [name body]
  (let [name-str (tostring name)]
    `(do (tset shorthand ,name-str ,body)
         (table.insert shorthand.all (. shorthand ,name-str)))))

;------------------------------------------------------------------------------;

(def-snippet pe
  (s {:trig :pe
      :desc "`public export`"}
     [(t "public export")]))

;------------------------------------------------------------------------------;

shorthand

; vim: lispwords+=def-snippet

