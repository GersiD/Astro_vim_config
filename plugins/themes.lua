-- Themes
return {
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup {
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = "moon",
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = "moon",
        disable_italics = true,
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = true, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { italic = false },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "dragon", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    },
  },
  { "folke/tokyonight.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "catppuccin/nvim",
    config = function() require("catppuccin").setup { transparent_background = false, no_italic = true } end,
  },
  { "EdenEast/nightfox.nvim" },
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      require("drop").setup {
        screensaver = false,
        theme = "leaves",
        max = 60,
        interval = 150,
      }
    end,
  },
}
