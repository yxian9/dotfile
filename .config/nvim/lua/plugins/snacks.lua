return {
  "folke/snacks.nvim",
  enabled = true,
  opts = {
    words = { enabled = false },
    image = {
      enabled = true,
      formats = {
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "tiff",
        "heic",
        "avif",
        "mp4",
        "mov",
        "avi",
        "mkv",
        "webm",
        "pdf",
      },
      doc = {
        max_width = 70,
      },
    },
    picker = {
      notifications = {
        config = {
          preview = false,
        },
      },
      win = {
        list = {
          wo = {
            wrap = true,
          },
        },
      },
    },
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
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
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
