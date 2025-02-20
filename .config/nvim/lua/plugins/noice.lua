return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    -- https://github.com/LazyVim/LazyVim/discussions/2223
    -- https://github.com/folke/noice.nvim/issues/846 set command_palette to false.
    presets = {
      command_palette = false,
      lsp_doc_border = true,
    },
    routes = {
      --https://github.com/neovim/nvim-lspconfig/issues/1931
      --filter when more then two lsp working at same time
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          -- kind = "echo",
          any = {
            -- { find = "mini.surround" },
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "written" },
            { find = "%d fewer lines" },
            { find = "%d more lines" },
          },
        },
        view = "mini",
        opts = {
          skip = true,
        },
      },
    },
    lsp = {
      signature = {
        opts = {
          size = {
            max_height = 15,
          },
        },
      },
    },
    cmdline = {
      enabled = true,
      view = "cmdline",
      format = {
        search_down = { conceal = false, kind = "search", pattern = "^/", icon = "", lang = "regex" },
        search_up = { conceal = false, kind = "search", pattern = "^%?", icon = "", lang = "regex" },
        cmdline = { pattern = "^:", icon = ">", lang = "vim", conceal = false },
        filter = { conceal = false, title = "bash" },
        lua = { conceal = false },
        help = { conceal = false },
      },
    },
    -- views = {
    --   cmdline_popup = {
    --     position = {
    --       row = "45%",
    --       col = "50%",
    --     },
    --   },
    -- },
  },
}
