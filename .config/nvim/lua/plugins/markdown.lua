return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      render_modes = { "n", "t", "v", "V" },
      heading = {
        sign = true,
        -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = {
        enabled = true,
      },
      anti_conceal = {
        enabled = true,
      },
      code = {
        language_name = false,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
}
