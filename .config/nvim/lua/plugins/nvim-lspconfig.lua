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
      },
      inlay_hints = { enabled = false },
      servers = {
        tailwindcss = {
          mason = false,
          root_dir = function(...)
            require("lspconfig").util.root_pattern("tailwind.config.cjs", "tailwind.config.js", "postcss.config.js")(
              ...
            )
          end,
        },
        denols = {
          mason = false,
          -- filetypes = { "typescript", "typescriptreact" },
          root_dir = require("lspconfig").util.root_pattern("deno.json"),
        },
        vtsls = {
          mason = false,
          root_dir = require("lspconfig").util.root_pattern("package.json"),
        },
        gopls = {
          mason = false,
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
  -- remove C-k
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- disable signature help in insert mode
      keys[#keys + 1] = { "<C-k>", false, mode = "i" }
    end,
  },
}
