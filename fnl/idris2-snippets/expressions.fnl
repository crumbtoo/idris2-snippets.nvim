(local {: s
        : sn
        : i
        : d
        : c
        : t}
  (require :idris2-snippets.internal.snippets))
(local util (require :idris2-snippets.internal.util))
;------------------------------------------------------------------------------;

(local expressions {:all []})

;; this could/should probably be a function
(macro def-snippet [name body]
  (let [name-str (tostring name)]
    `(do (tset expressions ,name-str ,body)
         (table.insert expressions.all (. expressions ,name-str)))))

;------------------------------------------------------------------------------;

(set expressions.if-single-line
     [(t "if ")
      (i 1 "_")
      (t " then ")
      (i 2 "_")
      (t " else ")
      (i 3 "_")])

(set expressions.if-multi-line
     [(t "if ")
      (i 1 "_")
      (d 2 (util.indent-newline-text "then "))
      (i 3 "_")
      (d 4 (util.indent-newline-text "else "))
      (i 5 "_")])

(def-snippet if-expr
  (s {:trig :if
      :desc "If-expression"}
     [(c 1 [(sn nil expressions.if-single-line)
            (sn nil expressions.if-multi-line)])]))

;------------------------------------------------------------------------------;

expressions

; vim: lispwords+=def-snippet

