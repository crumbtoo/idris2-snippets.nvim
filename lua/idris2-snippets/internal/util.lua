-- [nfnl] Compiled from fnl/idris2-snippets/internal/util.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("idris2-snippets.internal.snippets")
local s = _local_1_["s"]
local sn = _local_1_["sn"]
local i = _local_1_["i"]
local d = _local_1_["d"]
local c = _local_1_["c"]
local t = _local_1_["t"]
local M = {}
local function is_type_3f(t0, v)
  return (type(v) == t0)
end
local function nil_3f(x)
  return (nil == x)
end
local function get_buffer_option(name)
  return vim.api.nvim_buf_get_option(0, name)
end
local function indent_expand()
  local sw = get_buffer_option("shiftwidth")
  local indent
  if (sw ~= 0) then
    indent = sw
  else
    indent = __fnl_global__get_2dbuffer_2doptions("tabstop")
  end
  return string.rep(" ", indent)
end
M.indentation = function()
  if get_buffer_option("expandtab") then
    return indent_expand()
  else
    return "\9"
  end
end
M.indent = function()
  return sn(nil, {t({"", M.indentation()})})
end
local function indent_newline(mk_node, extra_indent, _, parent)
  local extra_indent_2a = ((extra_indent == nil) or extra_indent)
  local _0, pos = nil, nil
  local function _4_()
    return parent:get_buf_position()
  end
  _0, pos = pcall(_4_)
  local indent_count = pos[2]
  local indent_str = (string.rep(" ", indent_count) .. ((extra_indent_2a and M.indentation()) or ""))
  return mk_node(indent_str)
end
M["indent-newline-text"] = function(txt, extra_indent)
  local function mk_node(indent_str)
    return sn(nil, {text({"", (indent_str .. txt)})})
  end
  local function _5_(...)
    return indent_newline(mk_node, extra_indent, ...)
  end
  return _5_
end
return M
