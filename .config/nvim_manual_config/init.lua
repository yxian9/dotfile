-- print("advent of neovim")

require("config.lazy")

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.number = true
opt.shiftwidth = 2
opt.laststatus = 3
opt.termguicolors = true
opt.cursorline = true
opt.cursorlineopt = "number"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", "<cmd>.lua<CR>", { desc = "load current line" })
vim.keymap.set("v", "<space>x", "<cmd>lua<CR>", { desc = "load current line" })
vim.keymap.set("i", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
