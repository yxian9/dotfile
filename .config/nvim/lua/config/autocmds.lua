-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- vim.api.nvim_create_augroup("cursorline_cursorcolumn", { clear = true })
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   group = "cursorline_cursorcolumn",
--   pattern = "*",
--   command = "set cursorline",
-- })
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   group = "cursorline_cursorcolumn",
--   pattern = "*",
--   command = "set nocursorline",
-- })
--
vim.api.nvim_create_augroup("auto_save", { clear = true })
vim.api.nvim_create_autocmd("FocusLost", {
  group = "auto_save",
  pattern = "*",
  command = "wa",
})

-- set linenumber
-- https://github.com/LazyVim/LazyVim/discussions/1892
vim.api.nvim_create_augroup("line_highLight", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
  once = true,
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9900" })
    -- https://github.com/hrsh7th/nvim-cmp/issues/969
    -- vim.cmd("highlight Pmenu guibg=NONE")
  end,
  group = "line_highLight",
})

local augroup = vim.api.nvim_create_augroup
augroup("discontinue_comments", { clear = true })
local autocmds = vim.api.nvim_create_autocmd
autocmds({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o"
  end,
  group = "discontinue_comments",
  desc = "Dont't continue comments with o/O",
})
