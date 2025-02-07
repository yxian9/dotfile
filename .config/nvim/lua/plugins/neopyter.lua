return {
  "SUSTech-data/neopyter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter", -- neopyter don't depend on `nvim-treesitter`, but does depend on treesitter parser of python
    "AbaoFromCUG/websocket.nvim", -- for mode='direct'
  },

  ---@type neopyter.Option
  opts = {
    mode = "direct",
    remote_address = "127.0.0.1:9001",
    file_pattern = { "*.ju.*" },
    on_attach = function(buf)
      require("which-key").add({
        { "<space>js", "<cmd>Neopyter execute kernelmenu:restart<cr>", desc = "restart kernel" },
        { "<C-CR>", "<cmd>Neopyter execute notebook:run-cell<cr>", desc = "run selected" },
        { "<C-CR>", "<cmd>Neopyter execute notebook:run-cell<cr>", desc = "run selected" },
        { "<leader>j", "o# %%<CR><BS><BS>", desc = "add cell below" },
        buffer = buf,
      })
    end,
    -- highlight = {
    --   enable = false,
    -- },
  },
}
