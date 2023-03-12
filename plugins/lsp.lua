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
  { "github/copilot.vim", event = "User Astrofile", ft = { "py", "lua", "go", "rs", "java", "jl", "tex" } },
  {
    "nvim-treesitter/nvim-treesitter",
    cond = function() return vim.bo.filetype ~= "tex" end, -- disable treesitter for tex files
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
  -- RUST
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    opts = function()
      return {
        server = require("astronvim.utils.lsp").config "rust_analyzer",
        tools = {
          autoSetHints = true,
          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {
            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
          },
          runnables = {
            use_telescope = true,
          },
        },
      }
    end,
  },
}
