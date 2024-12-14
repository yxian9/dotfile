return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		enabled = false,
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
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_visual = "blue background"
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_menu_selection_background = "purple"
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "material"
			vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
			vim.g.gruvbox_material_cursor = "auto"
			vim.g.gruvbox_material_sign_column_background = "none"
			vim.g.gruvbox_material_diagnostic_text_highlight = 1
			vim.g.gruvbox_material_better_performance = 1

			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
