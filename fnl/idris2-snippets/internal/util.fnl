(local {: s
        : sn
        : i
        : d
        : c
        : t}
  (require :idris2-snippets.internal.snippets))
;------------------------------------------------------------------------------;
(local M {})
;------------------------------------------------------------------------------;

(fn is-type? [t v]
  (= (type v) t))

(fn nil? [x]
  (= nil x))

;------------------------------------------------------------------------------;

(fn get-buffer-option [name]
  (vim.api.nvim_buf_get_option 0 name))

(fn indent-expand []
  (let [sw (get-buffer-option :shiftwidth)
        indent (if (not= sw 0)
                   sw
                   (get-buffer-options :tabstop))]
    (string.rep " " indent)))

;; TODO: cache result?
(fn M.indentation []
  (if (get-buffer-option :expandtab)
      (indent-expand)
      "\t"))

(fn M.indent []
  (sn nil [(t ["" (M.indentation)])]))

; (fn indent-newline [mk-node ?extra-indent? _ parent]
;   (let [extra-indent (or (= nil ?extra-indent?)
;                          ?extra-indent?)
;         ;; XXX: Hack to work around below bug
;         (_ pos) (pcall #(parent:get_buf_position))
;         ;; FIXME: This prints an error
;         ;; pos (parent:get_buf_position)
;         indent-count (. pos 2)
;         indent-str (.. (string.rep " " indent-count)
;                        (or (and extra-indent (M.indentation))
;                            ""))]
;     (mk-node indent-str)))

; (fn M.indent-newline-text [text extra-indent]
;   (fn [...]
;     (indent-newline (fn [indent-str]
;                       (sn nil [(t ["" (.. indent-str text)])]))
;                     extra-indent
;                     ...)))

; (fn indent-newline [mk-node extra-indent _ parent]
;   (set-forcibly! extra-indent (or (= extra-indent nil) extra-indent))
;   (local (_ pos) (pcall (fn [] (parent:get_buf_position))))
;   (local indent-count (. pos 2))
;   (local indent-str
;          (.. (string.rep " " indent-count)
;              (or (and extra-indent (util.indent_str)) "")))
;   (mk-node indent-str))

(fn indent-newline [mk-node extra-indent _ parent]
  (let [extra-indent* (or (= extra-indent nil) extra-indent)
        (_ pos) (pcall (fn [] (parent:get_buf_position)))
        indent-count (. pos 2)
        indent-str (.. (string.rep " " indent-count)
                       (or (and extra-indent* (M.indentation)) ""))]
    (mk-node indent-str)))

(fn M.indent-newline-text [txt extra-indent]
  (fn mk-node [indent-str]
    (sn nil [(text ["" (.. indent-str txt)])]))
  (fn [...] (indent-newline mk-node extra-indent ...)))

M

