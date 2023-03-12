-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
-- Here we call ftplugin (filetype plugins) manually for git repo reasons. :)
-- Useful functions to know about
--  vim.inspect() -- pretty prints a table
--  vim.tbl_extend("force", {}, {}) -- merges two tables
--  vim.tbl_deep_extend("force", {}, {}) -- merges two tables recursively
-- vim.tbl_isempty({}) -- checks if a table is empty
vim.g.copilot_no_tab_map = true
-- vim.g.copilot_no_default_keymap = true
vim.api.nvim_set_keymap("i", "<Right>", 'copilot#Accept("")', { silent = true, expr = true, script = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.tex" },
  callback = function() require "user.ftplugin.tex" end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.py" },
  callback = function() require "user.ftplugin.python" end,
})
