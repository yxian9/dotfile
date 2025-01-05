return {
  {
    "echasnovski/mini.operators",
    version = false,
    opts = {
      replace = {
        prefix = "gp",
        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },
      exchange = {
        prefix = "gx",

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
      },

      sort = {
        prefix = "g2",

        -- Function which does the sort
        func = nil,
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "gp", mode = { "n", "x" }, false },
    },
  },
}
