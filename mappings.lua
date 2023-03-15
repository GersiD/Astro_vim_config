-- Mapping data with "desc" stored directly by vim.keymap.set().
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local buffer = require "astronvim.utils.buffer"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<leader>uu"] = { "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", desc = "Open Undo Tree" },
    ["<leader>h"] = { name = "Harpoon", desc = "🐳Harpoon" },
    ["<leader>hh"] = { "<cmd>GrapplePopup tags<cr>", desc = "Harpoon View" },
    ["<leader>ha"] = { '<cmd>lua require("grapple").toggle()<cr>', desc = "Harpoon Add File" },
    -- shortcut for starting the default lst for a file
    ["<leader>lS"] = { "<cmd>LspStart<cr>", desc = "Start LSP" },
    ["<Tab>"] = { function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-Tab>"] = { function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    -- quick sav
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["<C-z>"] = { ":u<cr>", desc = "Undo" },
    ["<C-a>"] = { "ggVG", desc = "Select All" },
    ["<C-c>"] = { '"+y', desc = "Copy" },
    ["<C-v>"] = { '"+gP', desc = "Paste" },
    ["y<leader>"] = { "0y$", desc = "Yank Entire Line" },
    ["<C-q>"] = {
      '<cmd>lua require("bufdelete").bufdelete(0, true)<cr>:q!<cr>',
      desc = "Force close buffer, then quit",
    },
    ["<leader>q"] = {
      '<cmd>lua require("bufdelete").bufdelete(0, true)<cr>:q!<cr>',
      desc = "Quit",
    },
    ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search current buffer" },
    ["<M-j>"] = { "15j", desc = "Jump Dowm" },
    ["<M-k>"] = { "15k", desc = "Jump Up" },
    -- tweak the find files shortcuts
    -- please note that by default <leader>ff finds only git tracked files and not "hidden" ones
    -- now <leader>ff finds all files and <leader>fF only looks at git tracked files
    ["<leader>r"] = {
      function()
        local opts = { show_buf_command = true } -- picker options
        local builtin = require "telescope.builtin"
        local themes = require "telescope.themes"
        builtin.commands(themes.get_ivy(opts))
        -- require("telescope.builtin").commands { layout_config = {} }
      end,
      desc = "Run Command",
    },
    ["<leader>fv"] = { function() require("telescope.builtin").vim_options() end, desc = "search Vim Options" },
    ["<leader>b"] = { name = "Buffers", desc = "📔Buffers" },
    ["<leader>p"] = { name = "Packages", desc = "📦Packages" },
    ["<leader>f"] = { name = "Find", desc = "🔎Find" },
    ["<leader>fF"] = {
      function() require("telescope.builtin").find_files() end,
      desc = "Search files",
    },
    ["<leader>ff"] = {
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      desc = "Search all files",
    },
    ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", desc = "Search Highlight Group" },
    -- Now <leader>fw fuzzy finds words in all files and <leader>fW looks only at git tracked files :)
    ["<leader>fW"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" },
    ["<leader>fw"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Search words in all files",
    },
    -- ["<leader>fn"] = { "<cmd>Noice telescope<cr>", desc = "Search Noice" },
    ["]n"] = { "<cmd>call search('^.\\+')<cr>", desc = "Next non-empty line" },
    ["[n"] = { "<cmd>call search('^.\\+', 'b')<cr>", desc = "Prev non-empty line" },
    ["]N"] = { "}", desc = "Next empty line" },
    ["[N"] = { "{", desc = "Prev empty line" },
    ["\\"] = false,
    ["-"] = { "<C-w>-", desc = "Decrease height" },
    ["="] = { "<C-w>+", desc = "Increase height" },
    ["ge"] = { "$", desc = "Goto line end" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
    ["C-i"] = false,
    ["<C-CR>"] = { "<cmd>Copilot panel<cr>", desc = "Copilot panel" },
  },
}
