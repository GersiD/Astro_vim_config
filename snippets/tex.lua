-- Abbreviations used in this article and the LuaSnip docs
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({ trig = "mcl" }, { t "\\mathcal{", i(1), t "}" }),
  s({ trig = "ff", dscr = "frac{}{}" }, {
    t "\\frac{",
    i(1), -- insert node 1
    t "}{",
    i(2), -- insert node 2
    t "}",
  }),
  s({ trig = "inc" }, { t "\\include{", i(1), t "}" }),
}
