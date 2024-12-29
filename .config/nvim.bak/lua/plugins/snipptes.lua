local ls = require("luasnip")
return {
  "nvim-cmp",
  opts = function(_, opts)
    for _, source in ipairs(opts.sources) do
      if source.name == "snippets" then
        source.keyword_length = 2 -- avoid uuid auto complete everywhere
        break
      end
    end
  end,
  keys = {
    { "<Tab>", mode = { "s" }, false },
    { "<S-Tab>", mode = { "i", "s" }, false },

    {
      "<C-j>",
      function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
        -- require("luasnip").jump(1)
      end,
      -- expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    {
      "<C-k>",
      function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end,
      -- expr = true,
      silent = true,
      mode = { "i", "s" },
    },
    -- for native snippet
    -- {
    --   "<C-j>",
    --   function()
    --     return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>"
    --   end,
    --   expr = true,
    --   silent = true,
    --   mode = { "i", "s" },
    -- },
    -- {
    --   "<C-k>",
    --   function()
    --     return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>"
    --   end,
    --   expr = true,
    --   silent = true,
    --   mode = { "i", "s" },
    -- },
  },
}
