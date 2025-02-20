-- if true then
--   return {}
-- end
return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
  keys = {
    { "<leader>9l", "<cmd>Leet list<cr>", { desc = "leetcode list" } },
    { "<leader>9y", "<cmd>Leet yank<cr>", { desc = "leetcode yank" } },
    { "<leader>9c", "<cmd>Leet lang<cr>", { desc = "leetcode lang" } },
    { "<leader>9s", "<cmd>Leet submit<cr>", { desc = "leetcode submit" } },
    { "<leader>9r", "<cmd>Leet run<cr>", { desc = "leetcode run" } },
    { "<leader>9o", "<cmd>Leet open<cr>", { desc = "leetcode open" } },
  },
  opts = {
    arg = "leetcode.nvim",
    lang = "golang",
    cn = { -- leetcode.cn
      enabled = false, ---@type boolean
      translator = false, ---@type boolean
      translate_problems = false, ---@type boolean
    },
    injector = {
      ["python3"] = {
        before = {
          "from typing import List",
          "from typing import Optional",
        },
      },
      ["typescript"] = {
        before = { [[import { TreeNode} from "./type.ts" ]] },
      },
      ["golang"] = {
        before = {
          "package leetcode",
        },
      },
    },
  },
}
