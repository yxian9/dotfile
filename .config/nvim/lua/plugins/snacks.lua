return {
  "folke/snacks.nvim",
  enabled = true,
  opts = {
    words = { enabled = false },
    terminal = {
      win = {
        position = "float",
      },
    },
    indent = {
      -- priority = 1,
      enabled = true,
      indent = {
        only_current = true,
        char = "┋",
        only_scope = false,
      },
      scope = {
        -- char = "|",
        -- char = "┋",
      },
    },
    chunk = {
      enabled = false,
    },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      },
    },
  },
}
