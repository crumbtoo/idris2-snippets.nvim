-- [nfnl] Compiled from fnl/idris2-snippets/init.fnl by https://github.com/Olical/nfnl, do not edit.
local idr = {all = {}}
local function import_snippets(name)
  idr[name] = require(("idris2-snippets." .. name))
  return vim.list_extend(idr.all, idr[name].all)
end
import_snippets("data")
import_snippets("expressions")
import_snippets("shorthand")
return idr
