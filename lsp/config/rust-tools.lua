-- Setup rust_analyzer via rust-tools.nvim
return {
  opts = function() return { server = require("astronvim.utils.lsp").config "rust_analyzer" } end,
}
