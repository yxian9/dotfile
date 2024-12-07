return {
	"tpope/vim-sleuth",
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			-- local cmp = require("cmp")
			opts.window = {
				-- completion = cmp.config.window.bordered(),
				completion = {
					border = "rounded",
					-- winhighlight = "Normal:CmpDocNormal",
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:CmpDocNormal",
				},

				-- documentation = cmp.config.window.bordered(),
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
