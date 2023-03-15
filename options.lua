-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = true, -- sets vim.opt.wrap
    -- shell = "pwsh",
    -- shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    -- shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    -- shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    -- shellquote = "",
    -- shellxquote = "",
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_enabled = true, -- enable diagnostics at start
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    python_host_skip_check = true, -- skip python host check
    python3_host_skip_check = true, -- skip python3 host check
    ruby_host_skip_check = true, -- skip ruby host check
    loaded_ruby_provider = 0,
    perl_host_skip_check = true, -- skip perl host check
    loaded_perl_provider = 0,
    node_host_prog = "C:/Users/gersi/AppData/Roaming/npm/node_modules/neovim/bin/cli.js",
    python_host_prog = "C:/Users/gersi/AppData/Local/Programs/Python/Python311/python.exe", -- set python host program
    python3_host_prog = "C:/Users/gersi/AppData/Local/Programs/Python/Python311/python.exe", -- set python3 host program
    ruby_host_prog = "C:/Ruby27-x64/bin/ruby.exe", -- set ruby host program which I currently dont have installed
    perl_host_prog = "C:/Perl64/bin/perl.exe", -- set perl host program which I currently dont have installed
    clipboard = {
      name = "win32yank", -- set clipboard provider
      copy = {
        ["+"] = "win32yank.exe -i --crlf", -- copy to clipboard
        ["*"] = "win32yank.exe -i --crlf", -- copy to clipboard
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf", -- paste from clipboard
        ["*"] = "win32yank.exe -o --lf", -- paste from clipboard
      },
    },
  },
  --nofsync = true, -- disable fsync
}
-- If you need more control, you can use the function()...end notation
-- options = function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--   return local_vim
-- end,
