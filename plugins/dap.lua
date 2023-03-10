return {
  "mfussenegger/nvim-dap",
  enabled = true,
  lazy = true,
  event = false,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      event = false,
      ft = "py",
      cmd = { "DapInstall", "DapUninstall" },
      opts = { automatic_setup = true },
      config = require "plugins.configs.mason-nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      event = false,
      ft = "py",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
  },
  -- init = function() table.insert(astronvim.file_plugins, "nvim-dap") end,
  -- config = function() require("plugins.configs.nvim-dap").setup {} end,
  keys = "<leader>d",
  ft = { "python", "py" },
}
