return {
  "mini.indentscope",
  config = function()
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
        delay = 100,
      },
    })
  end,
}
