-- if true then
--   return {}
-- end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     presets = {
  --       lsp_doc_border = true,
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- keys go here
      opts.diagnostics = {
        float = {
          border = "rounded",
        },
      }
    end,
  },
}
