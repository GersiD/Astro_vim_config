return function(client, bufnr)
  if client.name == "rust_analyzer" then
    local rt = require "rust-tools"
    vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Rust-Tools Hover" })
    vim.keymap.set(
      "n",
      "<leader>lA",
      rt.code_action_group.code_action_group,
      { buffer = bufnr, desc = "Rust-Tools Code Action" }
    )
  end
end
