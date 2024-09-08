return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      format = {
        filter = { conceal = false, title = "bash" },
        lua = { conceal = false },
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = "45%",
          col = "50%",
        },
      },
    },
  },
}
