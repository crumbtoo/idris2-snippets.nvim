-- [nfnl] Compiled from fnl/idris2-snippets/shorthand.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("idris2-snippets.internal.snippets")
local s = _local_1_["s"]
local sn = _local_1_["sn"]
local i = _local_1_["i"]
local d = _local_1_["d"]
local c = _local_1_["c"]
local t = _local_1_["t"]
local util = require("idris2-snippets.internal.util")
local shorthand = {all = {}}
do
  shorthand["pe"] = s({trig = "pe", desc = "`public export`"}, {t("public export")})
  table.insert(shorthand.all, shorthand.pe)
end
return shorthand
