return {
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
  { "Maan2003/lsp_lines.nvim", event = "LspAttach", config = function() require("lsp_lines").setup() end },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = {
      panel = {
        -- auto_refresh = true,
        -- enabled = false, -- disable panel for copilot-cmp
      },
      suggestion = {
        -- enabled = false, -- disable suggestion for copilot-cmp
        auto_trigger = true,
        debounce = 0,
        keymap = {
          accept = "<Right>",
          -- accept_word = "<>",
          -- accept_line = false,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cond = function() return vim.bo.filetype ~= "tex" end, -- disable treesitter for tex files
    opts = {
      -- ensure_installed = { "lua" },
      -- ensure_installed = {
      --   "lua",
      --   "regex",
      --   "markdown",
      --   "markdown_inline",
      --   "python",
      --   "julia",
      --   "java",
      --   "rust",
      --   "go",
      --   "vim",
      --   "help",
      --   "bash",
      -- },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    -- opts = {
    --   ensure_installed = { "lua_ls", "texlab" },
    -- },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    -- opts = {
    --   ensure_installed = { "stylua" },
    -- },
  },
  -- RUST
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    opts = function()
      return {
        server = require("astronvim.utils.lsp").config "rust_analyzer",
        tools = {
          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          -- hover_actions = {
          --   -- whether the hover action window gets automatically focused
          --   -- default: false
          --   -- auto_focus = true,
          -- },
          runnables = {
            use_telescope = true,
          },
        },
      }
    end,
  },
  -- Java
  {
    "mfussenegger/nvim-jdtls", -- load jdtls on module
    ft = { "java" },
    init = function()
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "java", -- autocmd to start jdtls
        callback = function() require("jdtls").start_or_attach(require("astronvim.utils.lsp").config "jdtls") end,
      })
    end,
  },
}
