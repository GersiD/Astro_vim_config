--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "stable", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = true, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
        },

        -- Set colorscheme to use
        colorscheme = "carbonfox",

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
                        local normal = astronvim.get_hlgroup "Normal"
                        local fg, bg = normal.fg, normal.bg
                        local bg_alt = astronvim.get_hlgroup("Visual").bg
                        local green = astronvim.get_hlgroup("String").fg
                        local red = astronvim.get_hlgroup("Error").fg
                        -- return a table of highlights for telescope based on colors gotten from highlight groups
                        return {
                                DashboardHeader = { fg = "#FE001A" },
                                DashboardFooter = { fg = "#000000" },
                                TelescopeBorder = { fg = bg_alt, bg = bg },
                                TelescopeNormal = { bg = bg },
                                TelescopePreviewBorder = { fg = bg, bg = bg },
                                TelescopePreviewNormal = { bg = bg },
                                TelescopePreviewTitle = { fg = bg, bg = green },
                                TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
                                TelescopePromptNormal = { fg = fg, bg = bg_alt },
                                TelescopePromptPrefix = { fg = red, bg = bg_alt },
                                TelescopePromptTitle = { fg = bg, bg = red },
                                TelescopeResultsBorder = { fg = bg, bg = bg },
                                TelescopeResultsNormal = { bg = bg },
                                TelescopeResultsTitle = { fg = bg, bg = bg },
                        }
                end,
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = false, -- sets vim.opt.wrap
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
                        vimtex_quickfix_open_on_warning = false, -- Hide that annoying quickfix window
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

        header = {
                "         __                              ___   __        .ama     ,",
                "      ,d888a                          ,d88888888888ba.  ,88\"I)   d",
                "     a88']8i                         a88\".8\"8)   `\"8888:88  \" _a8'",
                "   .d8P' PP                        .d8P'.8  d)      \"8:88:baad8P'",
                "  ,d8P' ,ama,   .aa,  .ama.g ,mmm  d8P' 8  .8'        88):888P'",
                " ,d88' d8[ \"8..a8\"88 ,8I\"88[ I88' d88   ]IaI\"        d8[         ",
                " a88' dP \"bm8mP8'(8'.8I  8[      d88'    `\"         .88          ",
                ",88I ]8'  .d'.8     88' ,8' I[  ,88P ,ama    ,ama,  d8[  .ama.g",
                "[88' I8, .d' ]8,  ,88B ,d8 aI   (88',88\"8)  d8[ \"8. 88 ,8I\"88[",
                "]88  `888P'  `8888\" \"88P\"8m\"    I88 88[ 8[ dP \"bm8m88[.8I  8[",
                "]88,          _,,aaaaaa,_       I88 8\"  8 ]P'  .d' 88 88' ,8' I[",
                "`888a,.  ,aadd88888888888bma.   )88,  ,]I I8, .d' )88a8B ,d8 aI",
                "  \"888888PP\"'        `8\"\"\"\"\"\"8   \"888PP'  `888P'  `88P\"88P\"8m\"",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
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
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
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
                ["server-settings"] = {
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
                        ['<leader>uu'] = { "<cmd>UndotreeToggle<cr><cmd>UndotreeFocus<cr>", desc = "Open Undo Tree" },
                        ['<leader>hh'] = { "<cmd>GrapplePopup tags<cr>", desc = "Harpoon View" },
                        ['<leader>ha'] = { "<cmd>lua require(\"grapple\").toggle()<cr>", desc = "Harpoon Add File" },
                        -- quick save
                        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
                        ["<C-z>"] = { ":u<cr>", desc = "Undo" },
                        ["<C-a>"] = { "ggVG", desc = "Select All" },
                        ["<C-c>"] = { "\"+y", desc = "Copy" },
                        ["<C-v>"] = { "\"+gP", desc = "Paste" },
                        ['y<leader>'] = { "0y$", desc = "Yank Entire Line" },
                        ["<C-q>"] = { "<cmd>lua require(\"bufdelete\").bufdelete(0, true)<cr>:q!<cr>",
                                desc = "Force close buffer, then quit" },
                        ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search current buffer" },
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },
                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                        ['mbbill/undotree'] = {
                        },
                        ['cbochs/grapple.nvim'] = {
                                setup = function() require("plenary") end,
                        },
                        --Theme
                        ['nyoom-engineering/oxocarbon.nvim'] = {},
                        ['catppuccin/nvim'] = {
                                config = function() require('catppuccin').setup { transparent_background = true } end,
                        },
                        ['EdenEast/nightfox.nvim'] = {},
                        ['navarasu/onedark.nvim'] = {
                                setup = function() require('onedark').setup { style = 'deep' } end,
                                config = function() require "onedark" end,
                        },
                        ['atelierbram/Base2Tone-nvim'] = {},
                        ['ggandor/leap.nvim'] = {
                                setup = function() require('leap').add_default_mappings() end,
                                config = function() require('leap').add_default_mappings() end,
                        },
                        ['Maan2003/lsp_lines.nvim'] = {
                                config = function() require('lsp_lines').setup() end,
                        },
                        ['nvim-lualine/lualine.nvim'] = {
                                setup = function() require('nvim-web-devicons') end,
                                config = function() require "user.lualine_conf" LUALINE_INIT() end,
                                -- config = function() require('lualine').setup { theme = 'auto' } end,
                        },
                        --Latex
                        ['lervag/vimtex'] = {
                                config = {
                                        ['vimtex_view_general_viewer'] = 'SumatraPDF',
                                        ['vimtex_view_method'] = 'SumatraPDF',
                                        ['vimtex_view_general_options'] = '-reuse-instance -forward-search @tex @line @pdf',
                                        ['vimtex_view_general_options_latexmk'] = '-reuse-instance',
                                }
                        },
                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- telescope = {
                --   defaults = {
                --     prompt_prefix = " ",
                --     selection_caret = "❯ ",
                --   },
                --   extensions = {
                --     fzf = {
                --       fuzzy = true, -- false will only do exact matching
                --       override_generic_sorter = true, -- override the generic sorter
                --       override_file_sorter = true, -- override the file sorter
                --       case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                --       -- the default case_mode is "smart_case"
                --     },
                --   },
                --   pickers = {
                --   },
                -- },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}
return config
