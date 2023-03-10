return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    opts.statusline = { -- statusline
      hl = { fg = "fg", bg = "bg" },
      status.component.mode(),
      status.component.git_branch(),
      status.component.file_info { filetype = {}, filename = false, file_modified = false },
      status.component.git_diff(),
      status.component.diagnostics(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      status.component.lsp { lsp_progress = false, surround = { separator = "space_right" } },
      status.component.treesitter(),
      status.component.nav(),
      {
        provider = function() return "  " .. os.date "%R" end,
      },
      status.component.mode { surround = { separator = "right" } },
    }
  end,
}
