-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--terminal
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.del("t", "<esc><esc>")
vim.keymap.del("n", "<c-/>")

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

function OpenTerminalRightSplit()
  vim.cmd("vsplit")
  vim.cmd("term")
  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("OpenTermSplit", OpenTerminalRightSplit, {})
