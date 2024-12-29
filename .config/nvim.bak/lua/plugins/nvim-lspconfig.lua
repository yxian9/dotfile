return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        Opts = {
          Float = {
            source = true,
          },
        },
        -- virtual_text = {
        --   spacing = 4,
        --   source = "if_many",
        --   prefix = "●",
        --   -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        --   -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        --   -- prefix = "icons",
        -- },
        -- signs = {
        --   text = {
        --     [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
        --     [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
        --     [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
        --     [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
        --   },
        -- },
      },
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = {
          -- exclude a filetype from the default_config
          filetypes_exclude = { "markdown", "typescript", "javascript" },
        },
        denols = {
          filetypes = { "typescript", "typescriptreact" },
          root_dir = function(...)
            return require("lspconfig").util.root_pattern("deno.jsonc", "deno.json")(...)
          end,
        },
        vtsls = {
          root_dir = require("lspconfig").util.root_pattern("package.json"),
        },
        gopls = {
          settings = {
            gopls = {
              analyses = {
                fieldalignment = false,
              },
            },
          },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- disable signature help in insert mode
      keys[#keys + 1] = { "<c-k>", false, mode = "i" }
    end,
  },
}
