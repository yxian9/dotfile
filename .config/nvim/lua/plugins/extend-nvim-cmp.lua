return {
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local cmp = require("cmp")

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      -- ["<tab>"] = cmp.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        -- if vim.snippet.active({ direction = 1 }) then
        --   vim.schedule(function()
        --     vim.snippet.jump(1)
        --   end)
        if cmp.visible() and has_words_before() then
          -- elseif cmp.visible() then
          cmp.confirm({ select = true })
        -- elseif has_words_before() then
        --   cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if vim.snippet.active({ direction = -1 }) then
      --     vim.schedule(function()
      --       vim.snippet.jump(-1)
      --     end)
      --   else
      --     fallback()
      --   end
      -- end, { "i", "s" }),
      ["<CR>"] = function(fallback)
        cmp.abort()
        fallback()
      end,
    })
  end,
}
