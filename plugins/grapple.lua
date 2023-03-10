return {
  "cbochs/grapple.nvim",
  cmd = "GrapplePopup",
  init = function() require "plenary" end,
  config = function()
    require("grapple").setup {
      scope = require("grapple").resolvers.directory,
      popup_options = {
        relative = "editor",
        width = 60,
        height = 12,
        style = "minimal",
        border = "rounded",
      },
    }
  end,
}
