-- lua/plugins/copilot.lua
return {
  "zbirenbaum/copilot.lua",
  -- config = function()
  --   if not require("copilot.client").is_disabled() then
  --     require("copilot.command").disable()
  --   end
  -- end,

  -- opts = {
  --   filetypes = {
  --     go = true,
  --     ["*"] = false,
  --   },
  -- },
  keys = {
    {
      "<leader>at",
      function()
        if require("copilot.client").is_disabled() then
          require("copilot.command").enable()
        else
          require("copilot.command").disable()
        end
      end,
      desc = "Toggle (Copilot)",
    },
  },
}
