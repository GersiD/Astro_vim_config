-- easily add or disable built in mappings added during LSP attaching
return {
  n = {
    -- ["<leader>lf"] = false -- disable formatting keymap
    ["<leader>la"] = {
      function()
        local curr_row = vim.api.nvim_win_get_cursor(0)[1]
        vim.lsp.buf.code_action {
          ["range"] = {
            ["start"] = { curr_row, 0 },
            ["end"] = { curr_row, 100 },
          },
        }
      end,
      desc = "Code Action On Line",
    },
  },
}
