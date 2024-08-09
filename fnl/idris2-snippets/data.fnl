(local {: s
        : sn
        : i
        : d
        : c
        : t}
  (require :idris2-snippets.internal.snippets))
(local util (require :idris2-snippets.internal.util))
;------------------------------------------------------------------------------;

(local data {:all []})

;; this could/should probably be a function
(macro def-snippet [name body]
  (let [name-str (tostring name)]
    `(do (tset data ,name-str ,body)
         (table.insert data.all (. data ,name-str)))))

;------------------------------------------------------------------------------;
; ADTs

(fn adt-alt [str]
  "Return a closure which places `str' on a new line, correctly indented. Used
in `data.adt' with the `=' and `|' signs placed before constructor
alternatives."
  (fn []
    (sn nil [(t ["" (.. (util.indentation) str)])])))

(fn adt-constructor []
  (sn nil [(c 1
              [(t "")
               (sn nil
                   [(d 1 (adt-alt "| "))
                    (i 2 :Constructor)
                    (d 3 adt-constructor)])])]))

(set data.simple-adt
  (sn nil
      [(t "data ")
       (i 1 :TypeName)
       (c 2 [(d 1 (adt-alt "= "))
             (sn nil
                 [(t " ")
                  (i 1 "a")
                  (d 2 (adt-alt "= "))])])
       (i 3 :Constructor)
       (d 4 (adt-alt "| "))
       (i 5 :Constructor)
       (d 6 adt-constructor)]))

(fn iadt-constructor-rec [type-name]
  (fn []
    ; (sn nil
    ;     [(t "constructor rec")])
    (sn nil
        [(c 1
            [(t "")
             (sn nil
                 [(d 1 util.indent)
                  (i 2 :Constructor)
                  (t " : ")
                  (i 3 type-name)
                  (d 4 (iadt-constructor-rec type-name))])])])))

(fn iadt-constructor [[[type-name]]]
  ((iadt-constructor-rec type-name)))

(set data.inductive-adt
  (sn nil
      [(t "data ")
       (i 1 :TypeName)
       (t " : ")
       (i 2 :Type)
       (t " -> Type where")
       (d 3
          (fn [[[type-name]]]
            (sn nil
                [(d 1 util.indent)
                 (i 2 "Constructor")
                 (t " : ")
                 (i 3 type-name)]))
          [1])
       (d 4 iadt-constructor [1])
       ]))

(def-snippet adt
  (s {:trig :adt
      :desc "Datatype declaration"}
     [(c 1 [data.inductive-adt
            data.simple-adt])]))

;------------------------------------------------------------------------------;
; records

(fn record-constructor [[[type-name]]]
  (sn nil
      [(d 1 util.indent)
       (t "constructor ")
       (i 2 (.. "Mk" type-name))]))

(fn record-field []
  (sn nil
      [(c 1
          [(t "")
           (sn nil
               [(d 1 util.indent)
                (i 2 "field")
                (t " : ")
                (i 3 "FieldType")
                (d 4 record-field)
                ])])]))

(def-snippet rec
  (s {:trig :rec
      :desc "Record declaration"}
     [(t "record ")
      (i 1 :Record)
      (t " where")
      (d 2 record-constructor [1])
      (d 3 util.indent)
      (i 4 "field")
      (t " : ")
      (i 5 "FieldType")
      (d 6 record-field)]))

;------------------------------------------------------------------------------;

(def-snippet cls
  (s {:trig :cls
      :desc "Typeclass declaration"}
     [(t "interface ")
      (i 1 "Class")
      (d 2 #(sn nil [(t [" where" (util.indentation)])]))
      (i 3)]))

(def-snippet ins
  (s {:trig :ins
      :desc "Instance declaration"}
     [(t "implementation ")
      (i 1 "Class")
      (t " ")
      (i 2 "Type")
      (d 3 #(sn nil [(t [" where" (util.indentation)])]))
      (i 4)]))

(def-snippet constraint
  (s {:trig "=>"
      :desc "Typeclass constraint"}
     [(i 1 "Class")
      (t " ")
      (i 2 "a")
      (t " => ")
      (i 3)]))

;------------------------------------------------------------------------------;

data

; vim: lispwords+=def-snippet

