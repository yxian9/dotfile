return {
  "saghen/blink.cmp",
  -- dependencies = {
  --   "moyiz/blink-emoji.nvim",
  -- },
  opts = {
    -- snippets = { preset = "luasnip" },
    fuzzy = {
      -- use_typo_resistance = false,
      -- use_frecency = false,
      sorts = { "sort_text", "score" },
    },
    -- sources = {
    --   default = { "snippets", "buffer", "lsp", "path", "emoji" },
    --   providers = {
    --     -- snippets = {
    --     --   score_offset = 20,
    --     -- },
    --     emoji = {
    --       module = "blink-emoji",
    --       name = "Emoji",
    --       -- score_offset = 1, -- Tune by preference
    --       opts = { insert = true }, -- Insert emoji (default) or complete its name
    --     },
    --   },
    -- },
    completion = {
      menu = {
        border = "rounded",
        -- try add lable for completion
        -- draw = {
        --   columns = {
        --     { "label", "label_description", gap = 1 },
        --     { "kind_icon", "kind", "source_name" }, -- add source name
        --     -- { "kind_icon", "kind" },
        --   },
        -- },
      },
      documentation = { window = { border = "rounded" } },
    },
    signature = { window = { border = "single" } },
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "fallback",
      },
      ["<C-j>"] = { "snippet_forward", "fallback" },
      ["<C-k>"] = { "snippet_backward", "fallback" },

      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<Up>"] = { "scroll_documentation_up", "fallback" },
      ["<Down>"] = { "scroll_documentation_down", "fallback" },
    },
  },
}
