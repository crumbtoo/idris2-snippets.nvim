(local idr {:all {}})

(fn import-snippets [name]
  (tset idr name (require (.. :idris2-snippets. name)))
  (vim.list_extend idr.all (. idr name :all)))

(import-snippets "data")
(import-snippets "expressions")
(import-snippets "shorthand")

; (set idr.data (require :idris2-snippets.data))
; (vim.list_extend idr.all idr.data.all)

; (set idr.data (require :idris2-snippets.data))
; (vim.list_extend idr.all idr.data.all)

idr

