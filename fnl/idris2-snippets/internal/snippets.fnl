(local ls (require :luasnip))

(local events (require :luasnip.util.events))
(local ai (require :luasnip.nodes.absolute_indexer))
(local extras (require :luasnip.extras))
(local fmt (require :luasnip.extras.fmt))

{:s ls.snippet
 :sn ls.snippet_node
 :sn* (partial ls.snippet_node nil)
 :isn ls.indent_snippet_node
 :t ls.text_node
 :i ls.insert_node
 :f ls.function_node
 :c ls.choice_node
 :d ls.dynamic_node
 :r ls.restore_node
 :events events
 :ai ai
 :extras extras
 :l extras.lambda
 :rep extras.rep
 :p extras.partial
 :m extras.match
 :n extras.nonempty
 :dl extras.dynamic_lambda
 :fmt fmt.fmt
 :fmta fmt.fmta
 :conds (require :luasnip.extras.expand_conditions)
 :postfix (. (require :luasnip.extras.postfix) :postfix)
 :types (require :luasnip.util.types)
 :parse (. (require :luasnip.util.parser) :parse_snippet)
 :ms ls.multi_snippet
 :k (. (require :luasnip.nodes.key_indexer) :new_key)}

