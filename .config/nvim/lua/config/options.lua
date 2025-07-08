-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_eslint_auto_format = false
vim.highlight.priorities.semantic_tokens = 95
vim.g.snacks_animate = false

local opt = vim.opt
opt.conceallevel = 0

opt.winbar = "  %m %f"
opt.clipboard = "unnamedplus"

vim.opt.cursorlineopt = "number" -- diable line heightlght, keep line highlight

vim.api.nvim_set_hl(0, "GitConflictAncestor", { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, "GitConflictAncestorLabel", { fg = "#ffffff", bg = "#1d3b40" })

opt.inccommand = "split"
-- vim.cmd([[highlight LineNr guifg=]])
-- vim.cmd("hi LineNr guifg=")
-- https://github.com/LazyVim/LazyVim/issues/556
local float = { focusable = true, style = "minimal", border = "rounded" }
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)

-- expand ee to e %:h using <c-]
-- vim.cmd([[cnoreabbrev <expr> ee getcmdtype() == ':' && getcmdline() == 'ee' ? 'e '.expand('%:h').'/' : 'ee']])
