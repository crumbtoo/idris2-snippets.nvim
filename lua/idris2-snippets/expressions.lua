-- [nfnl] Compiled from fnl/idris2-snippets/expressions.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("idris2-snippets.internal.snippets")
local s = _local_1_["s"]
local sn = _local_1_["sn"]
local i = _local_1_["i"]
local d = _local_1_["d"]
local c = _local_1_["c"]
local t = _local_1_["t"]
local util = require("idris2-snippets.internal.util")
local expressions = {all = {}}
expressions["if-single-line"] = {t("if "), i(1, "_"), t(" then "), i(2, "_"), t(" else "), i(3, "_")}
expressions["if-multi-line"] = {t("if "), i(1, "_"), d(2, util["indent-newline-text"]("then ")), i(3, "_"), d(4, util["indent-newline-text"]("else ")), i(5, "_")}
do
  expressions["if-expr"] = s({trig = "if", desc = "If-expression"}, {c(1, {sn(nil, expressions["if-single-line"]), sn(nil, expressions["if-multi-line"])})})
  table.insert(expressions.all, expressions["if-expr"])
end
return expressions
