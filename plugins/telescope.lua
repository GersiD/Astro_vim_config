return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = true, build = "make" },
  },
  cmd = "Telescope",
  opts = {
    defaults = {
      preview = {
        treesitter = false,
      },
    },
  },
  config = require "plugins.configs.telescope",
}
