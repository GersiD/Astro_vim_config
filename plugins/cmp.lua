return {
  { "hrsh7th/cmp-omni", ft = { "tex" } },
  {
    "hrsh7th/nvim-cmp",
    event = "User AstroFile",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
    },
    opts = {
      performance = {
        debounce = 0,
        throttle = 0,
        fetching_timeout = 0,
      },
      -- experimental = {
      --   ghost_text = false,
      -- },
      completion = {
        keyword_length = 1,
      },
      matching = {
        fuzzy = {
          fuzzy = true,
          smart_case = true,
        },
      },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format { mode = "symbol_text", maxwidth = 50 }(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      -- CMP Source Priorities
      -- modify here the priorities of default cmp sources
      -- higher value == higher priority
      -- The value can also be set to a boolean for disabling default sources:
      -- false == disabled
      -- true == 1000
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "nvim_lsp_signature_help", priority = 600 },
        { name = "luasnip", priority = 500 },
        { name = "buffer", priority = 500, keyword_length = 3 },
        { name = "path", priority = 250 },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip_loader = require "luasnip.loaders.from_lua"
      luasnip_loader.lazy_load {
        paths = { "C:\\Users\\gersi\\AppData\\Local\\nvim\\lua\\user\\snippets\\" },
      }
    end,
  },
}
