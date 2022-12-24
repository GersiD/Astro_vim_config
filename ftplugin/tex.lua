vim.api.nvim_create_user_command("VimtexCleanThenCompile", function()
  vim.cmd "VimtexClean"
  vim.cmd "VimtexCompile"
end, {})
vim.api.nvim_create_user_command("VimtexStopThenClean", function()
  vim.cmd "VimtexStop"
  vim.cmd "VimtexClean"
end, {})
-- multiple commands on one line, use | (vert bar)
vim.api.nvim_create_autocmd("FileType", {
  desc = "Compile Latex Doc",
  pattern = "tex",
  command = "nnoremap <leader>lc <cmd>VimtexCleanThenCompile<cr>",
})
vim.api.nvim_create_autocmd("FileType", {
  desc = "Clean Latex Proj",
  pattern = "tex",
  command = "nnoremap <leader>lC <cmd>VimtexStopThenClean<cr>",
})
vim.api.nvim_create_autocmd("FileType", {
  desc = "View Latex Proj",
  pattern = "tex",
  command = "nnoremap <leader>lv <cmd>VimtexView<cr>",
})
-- Yes, we're just executing a bunch of Vimscript using vim.cmd
vim.cmd [[
          imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- Lets silence some errors :)
-- vim["g"]["vimtex_quickfix_ignore_filters"] = {
--   "Underfull",
--   "Overfull",
-- }

vim.cmd [[
  let g:vimtex_quickfix_ignore_filters = [
  \'Underfull',
  \'Overfull',
  \]
]]

-- Hide that annoying quickfix windowvimtexvimtex"
vim["g"]["vimtex_quickfix_open_on_warning"] = false
