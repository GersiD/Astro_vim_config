--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "nightly",   -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = true,    -- automatically reload and sync packer after a successful update
    auto_quit = false,     -- automatically quit the current session after a successful update
  },
  -- Add highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
    -- set highlights for all themes
    -- use a function override to let us use lua to retrieve colors from highlight group
    -- there is no default table so we don't need to put a parameter for this function
    init = function()
      -- get highlights from highlight groups
      -- return a table of highlights for telescope based on colors gotten from highlight groups
      local utils = require "astronvim.utils"
      -- local red = utils.get_hlgroup "Error" -- Example of how to get_hlgroup
      return {
        NvimSurroundHighlight = { fg = "#7FB4CA" },
        DashboardHeader = { fg = "#FE001A" },
        DashboardFooter = { fg = "#FE001A" },
        DashboardShortcut = { fg = "#FBF1C7" },
        DashboardCenter = { fg = "#FBF1C7" },
        FloatBorder = { fg = "#458588" },
        -- Which Key
        WhichKey = { fg = "#98971a" },                      -- Controls the color of the key
        WhichKeyDesc = { fg = "#a89984" },                  -- Controls the desc of a key
        WhichKeyFloat = { bg = "#282828", fg = "#a89984" }, -- Controls the background
        WhichKeyGroup = { fg = "#0A4E22" },                 -- Controls the groups
        WhichKeyValue = {},                                 -- No one knows
        WhichKeyBorder = {},                                -- No one knows
        WhichKeySeparator = {},                             -- Controls the white space between shit
      }
    end,
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = true,           -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ",                   -- sets vim.g.mapleader
      autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,                -- enable completion at start
      autopairs_enabled = true,          -- enable autopairs at start
      diagnostics_enabled = true,        -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --   return local_vim
  -- end,

  -- Default theme configuration
  default_theme = {
    DiagnosticError = { italic = false },
    DiagnosticHint = { italic = false },
    DiagnosticInfo = { italic = false },
    DiagnosticWarn = { italic = false },
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
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
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      lua_ls = function(config)
        return {
          Lua = {
            workspace = {
              library = {
                require("neodev.config").types(),
              },
              checkThirdParty = true,
            },
          },
        }
      end,
      jdtls = function(_)
        return {
          cmd = {
            "java", -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xms1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens",
            "java.base/java.util=ALL-UNNAMED",
            "--add-opens",
            "java.base/java.lang=ALL-UNNAMED",
            "-javaagent:" .. "C:\\Users\\gersi\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\lombok.jar",

            -- 💀
            "-jar",
            "C:\\Users\\gersi\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
            -- Must point to the                                                     Change this to
            -- eclipse.jdt.ls installation                                           the actual version

            -- 💀
            "-configuration",
            "C:\\Users\\gersi\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win",
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
            -- Must point to the                      Change to one of `linux`, `win` or `mac`
            -- eclipse.jdt.ls installation            Depending on your system.

            -- 💀
            -- See `data directory configuration` section in the README
            "-data",
            "C:\\Users\\gersi\\.cache\\jdtls\\workspace",
          },
          root_dir = function()
            return vim.fs.dirname(
                  vim.fs.find({ ".gradlew", ".gitignore", "mvnw", "build.grade.kts" }, { upward = true })[1]
                ) .. "\\"
          end,
        }
      end,
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
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
          ["H"] = { "<cmd>bprevious<cr>", desc = "prev buff" },
          ["L"] = { "<cmd>bnext<cr>", desc = "next buff" },
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
          ["jj"] = false,
          ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
    },
  },
  -- Set colorscheme to use
  colorscheme = "kanagawa",
  -- Configure plugins
  plugins = {
    {
      "chrisgrieser/nvim-various-textobjs",
      event = "VeryLazy",
      config = function() require("various-textobjs").setup { useDefaultKeymaps = true } end,
    },
    {
      "hrsh7th/nvim-cmp",
      event = "VeryLazy",
      dependencies = {
        { "stevearc/dressing.nvim" },
        { "hrsh7th/cmp-omni" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-buffer" },
        { "saadparwaiz1/cmp_luasnip" },
        { "Maan2003/lsp_lines.nvim" },
        { "L3MON4D3/LuaSnip" },
        { "folke/neodev.nvim" },
        { "j-hui/fidget.nvim" },
      },
    },
    {
      "j-hui/fidget.nvim", -- Provides info on the status of the LSP
      event = "VeryLazy",
      config = function() require("fidget").setup {} end,
    },
    { "folke/neodev.nvim", config = function() require("neodev").setup() end },
    { "mbbill/undotree",   cmd = "UndotreeToggle" },
    {
      "cbochs/grapple.nvim",
      cmd = "GrapplePopup",
      init = function() require "plenary" end,
      config = function()
        require("grapple").setup {
          scope = require("grapple").resolvers.git,
          popup_options = {
            relative = "editor",
            width = 60,
            height = 12,
            style = "minimal",
            border = "rounded",
          },
        }
      end,
    },
    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup {
          keymaps = {
            normal = "s",
            visual = "s",
          },
          aliases = {
                ["s"] = "]", -- Square brackets
                ["p"] = ")", -- Paren
                ["b"] = "}", -- Brackets
                ["q"] = '"', -- Quotes
                ["m"] = "$", -- Math (latex)
          },
        }
      end,
    },
    { "Maan2003/lsp_lines.nvim",         config = function() require("lsp_lines").setup() end },
    {
      "nvim-lualine/lualine.nvim",
      lazy = false,
      dependencies = { "nvim-web-devicons" },
      config = function()
        require "user.lualine_conf"
        LUALINE_INIT()
      end,
      -- config = function() require('lualine').setup { theme = 'auto' } end,
    },
    --Latex
    {
      "lervag/vimtex",
      lazy = false,
      config = function()
        return {
              ["vimtex_view_general_viewer"] = "SumatraPDF",
              ["vimtex_view_method"] = "SumatraPDF",
              ["vimtex_view_general_options"] = "-reuse-instance -forward-search @tex @line @pdf",
              ["vimtex_view_general_options_latexmk"] = "-reuse-instance",
        }
      end,
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function(plugin, opts)
        require "plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
        -- add more custom autopairs configuration such as custom rules
        local npairs = require "nvim-autopairs"
        local Rule = require "nvim-autopairs.rule"
        local cond = require "nvim-autopairs.conds"
        npairs.add_rules {
          Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
              :with_pair(cond.not_after_regex "%%")
          -- don't add a pair if  the previous character is xxx
              :with_pair(
                cond.not_before_regex("xxx", 3)
              )
          -- don't move right when repeat character
              :with_move(cond.none())
          -- don't delete if the next character is xx
              :with_del(cond.not_after_regex "xx")
          -- disable adding a newline when you press <cr>
              :with_cr(cond.none()),
        }
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        require "plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
        -- add more custom luasnip configuration such as filetype extend or custom snippets
        local luasnip_loader = require "luasnip.loaders.from_lua"
        luasnip_loader.lazy_load {
          paths = { "C:\\Users\\gersi\\AppData\\Local\\nvim\\lua\\user\\snippets\\" },
        }
      end,
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        opts.section.header.val = {
          "         __                              ___   __        .ama     ,",
          '      ,d888a                          ,d88888888888ba.  ,88"I)   d',
          '     a88\']8i                         a88".8"8)   `"8888:88  " _a8\'',
          "   .d8P' PP                        .d8P'.8  d)      \"8:88:baad8P'",
          "  ,d8P' ,ama,   .aa,  .ama.g       d8P' 8  .8'        88):888P'",
          ' ,d88\' d8[ "8..a8"88 ,8I"88[     /d88   ]IaI"        d8[         ',
          " a88' dP \"bm8mP8'(8'.8I  8[      d88'    `\"         .88          ",
          ",88I ]8'  .d'.8     88' ,8' I[  ,88P ,ama    ,ama,  d8[  .ama.g",
          "[88' I8, .d' ]8,  ,88B ,d8 aI   (88',88\"8)  d8[ \"8. 88 ,8I\"88[",
          ']88  `888P\'  `8888" "88P"8m"    I88 88[ 8[ dP "bm8m88[.8I  8[',
          "]88,          _,,aaaaaa,_       I88 8\"  8 ]P'  .d' 88 88' ,8' I[",
          "`888a,.  ,aadd88888888888bma.   )88,  ,]I I8, .d' )88a8B ,d8 aI",
          '  "888888PP"\'        `8""""""8   "888PP\'  `888P\'  `88P"88P"8m"',
        }
        return opts
      end,
    },
    -- Themes
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("kanagawa").setup {
          commentStyle = { italic = false },
          functionStyle = { italic = false },
          keywordStyle = { italic = false },
          statementStyle = { italic = false },
          variablebuiltinStyle = { italic = false },
        }
      end,
    },
    { "folke/tokyonight.nvim" },
    { "nyoom-engineering/oxocarbon.nvim" },
    {
      "catppuccin/nvim",
      config = function() require("catppuccin").setup { transparent_background = false } end,
    },
    { "EdenEast/nightfox.nvim" },
    {
      "folke/drop.nvim",
      event = "VimEnter",
      config = function()
        require("drop").setup {
          screensaver = false,
          theme = "leaves",
          max = 60,
          interval = 150,
        }
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        -- config variable is the default configuration table for the setup function call
        local null_ls = require "null-ls"

        -- Check supported formatters and linters
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
        config.sources = {
          -- Set a formatter
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.formatting.prettier,
        }
        return config -- return final config table
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        -- ensure_installed = { "lua" },
        ensure_installed = {
          "lua",
          "python",
          "julia",
          "java",
          "rust",
          "go",
          "vim",
          "help",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      -- overrides `require("mason-lspconfig").setup(...)`
      opts = {
        ensure_installed = { "lua_ls", "ltex", "texlab" },
      },
    },
    {
      "jay-babu/mason-null-ls.nvim",
      -- overrides `require("mason-null-ls").setup(...)`
      opts = {
        ensure_installed = { "stylua" },
      },
    },
  },
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = function(config)
    local cmp = require "cmp"
    return astronvim.default_tbl({
      sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "omni",     priority = 750 },
        { name = "nvim_lua", priority = 750 }, -- only enables itself inside of lua, as it should :)
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500, keyword_length = 5 },
        { name = "path",     priority = 250 },
      },
    }, config)
  end,
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Here we call ftplugin (filetype plugins) manually for git repo reasons. :)
    -- Useful functions to know about
    --  vim.inspect() -- pretty prints a table
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
      pattern = { "*.tex" },
      callback = function() require "user.ftplugin.tex" end,
    })
  end,
}

return config
