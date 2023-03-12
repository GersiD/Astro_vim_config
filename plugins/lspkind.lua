return {
  "onsails/lspkind.nvim",
  opts = {
    mode = "symbol_text",
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Field = "ﰠ",
      Variable = "",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      Array = "",
      Boolean = "",
      Class = "",
      Constructor = "",
      Key = "",
      Namespace = "{}",
      Null = "NULL",
      Number = "#",
      Object = "",
      Package = "",
      Reference = "",
      String = "",
      TypeParameter = "",
    },
  },
  config = require "plugins.configs.lspkind",
}