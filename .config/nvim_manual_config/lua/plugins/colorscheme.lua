return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("tokyonight").setup({
	on_colors = function(colors)
	  colors.border = "#565f89"
	end,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
    -- opts = {
    --   style = "night",
    --   on_colors = function(colors)
    --     colors.border = "#64748b"
    --   end,
    -- },
  },
}
