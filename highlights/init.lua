-- Add highlight groups in any theme
local utils = require "astronvim.utils"
return {
  -- duskfox = { -- a table of overrides/changes to the duskfox theme
  --   Normal = { bg = "#000000" },
  -- },
  -- set highlights for all themes
  -- use a function override to let us use lua to retrieve colors from highlight group
  -- there is no default table so we don't need to put a parameter for this function
  -- get highlights from highlight groups
  -- return a table of highlights for telescope based on colors gotten from highlight groups
  -- local red = utils.get_hlgroup "Error" -- Example of how to get_hlgroup
  NvimSurroundHighlight = { fg = "#7FB4CA" },
  DashboardHeader = { fg = "#FE001A" },
  DashboardFooter = { fg = "#FE001A" },
  DashboardShortcut = { fg = "#FBF1C7" },
  DashboardCenter = { fg = "#FBF1C7" },
  -- FloatBorder = { fg = "#458588" },
  -- Which Key
  -- WhichKey = { fg = "#98971a" }, -- Controls the color of the key
  -- WhichKeyDesc = { fg = "#a89984" }, -- Controls the desc of a key
  -- WhichKeyFloat = { bg = "#282828", fg = "#a89984" }, -- Controls the background
  -- WhichKeyGroup = { fg = "#0A4E22" }, -- Controls the groups
  -- WhichKeyValue = {}, -- No one knows
  -- WhichKeyBorder = {}, -- No one knows
  -- WhichKeySeparator = {}, -- Controls the white space between shit
  PmenuSel = { bg = "#282C34", fg = "NONE" },
  Pmenu = { fg = "#C5CDD9", bg = "#22252A" },
  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE" },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE" },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE" },
  CmpItemMenu = { fg = "#C792EA", bg = "NONE" },
  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}
