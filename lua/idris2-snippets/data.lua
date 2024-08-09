-- [nfnl] Compiled from fnl/idris2-snippets/data.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("idris2-snippets.internal.snippets")
local s = _local_1_["s"]
local sn = _local_1_["sn"]
local i = _local_1_["i"]
local d = _local_1_["d"]
local c = _local_1_["c"]
local t = _local_1_["t"]
local util = require("idris2-snippets.internal.util")
local data = {all = {}}
local function adt_alt(str)
  local function _2_()
    return sn(nil, {t({"", (util.indentation() .. str)})})
  end
  return _2_
end
local function adt_constructor()
  return sn(nil, {c(1, {t(""), sn(nil, {d(1, adt_alt("| ")), i(2, "Constructor"), d(3, adt_constructor)})})})
end
data["simple-adt"] = sn(nil, {t("data "), i(1, "TypeName"), c(2, {d(1, adt_alt("= ")), sn(nil, {t(" "), i(1, "a"), d(2, adt_alt("= "))})}), i(3, "Constructor"), d(4, adt_alt("| ")), i(5, "Constructor"), d(6, adt_constructor)})
local function iadt_constructor_rec(type_name)
  local function _3_()
    return sn(nil, {c(1, {t(""), sn(nil, {d(1, util.indent), i(2, "Constructor"), t(" : "), i(3, type_name), d(4, iadt_constructor_rec(type_name))})})})
  end
  return _3_
end
local function iadt_constructor(_4_)
  local _arg_5_ = _4_
  local _arg_6_ = _arg_5_[1]
  local type_name = _arg_6_[1]
  return iadt_constructor_rec(type_name)()
end
local function _10_(_7_)
  local _arg_8_ = _7_
  local _arg_9_ = _arg_8_[1]
  local type_name = _arg_9_[1]
  return sn(nil, {d(1, util.indent), i(2, "Constructor"), t(" : "), i(3, type_name)})
end
data["inductive-adt"] = sn(nil, {t("data "), i(1, "TypeName"), t(" : "), i(2, "Type"), t(" -> Type where"), d(3, _10_, {1}), d(4, iadt_constructor, {1})})
do
  data["adt"] = s({trig = "adt", desc = "Datatype declaration"}, {c(1, {data["inductive-adt"], data["simple-adt"]})})
  table.insert(data.all, data.adt)
end
local function record_constructor(_11_)
  local _arg_12_ = _11_
  local _arg_13_ = _arg_12_[1]
  local type_name = _arg_13_[1]
  return sn(nil, {d(1, util.indent), t("constructor "), i(2, ("Mk" .. type_name))})
end
local function record_field()
  return sn(nil, {c(1, {t(""), sn(nil, {d(1, util.indent), i(2, "field"), t(" : "), i(3, "FieldType"), d(4, record_field)})})})
end
do
  data["rec"] = s({trig = "rec", desc = "Record declaration"}, {t("record "), i(1, "Record"), t(" where"), d(2, record_constructor, {1}), d(3, util.indent), i(4, "field"), t(" : "), i(5, "FieldType"), d(6, record_field)})
  table.insert(data.all, data.rec)
end
do
  local function _14_()
    return sn(nil, {t({" where", util.indentation()})})
  end
  data["cls"] = s({trig = "cls", desc = "Typeclass declaration"}, {t("interface "), i(1, "Class"), d(2, _14_), i(3)})
  table.insert(data.all, data.cls)
end
do
  local function _15_()
    return sn(nil, {t({" where", util.indentation()})})
  end
  data["ins"] = s({trig = "ins", desc = "Instance declaration"}, {t("implementation "), i(1, "Class"), t(" "), i(2, "Type"), d(3, _15_), i(4)})
  table.insert(data.all, data.ins)
end
do
  data["constraint"] = s({trig = "=>", desc = "Typeclass constraint"}, {i(1, "Class"), t(" "), i(2, "a"), t(" => "), i(3)})
  table.insert(data.all, data.constraint)
end
return data
