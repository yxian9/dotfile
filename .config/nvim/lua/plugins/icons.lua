-- if true then
--   return {}
-- end
return {
  "echasnovski/mini.icons",
  opts = {
    filetype = {
      -- go = { glyph = "\u{f2af}", hl = "MiniIconsAzure" },
      -- go = { glyph = "\u{f07d3}", hl = "MiniIconsAzure" },
      go = { glyph = "\u{e724}" },
      nextflow = { glyph = "\u{eead}", hl = "MiniIconsAzure" },
    },
    file = {
      -- go = { glyph = "\u{f2af}", hl = "MiniIconsAzure" },
      -- go = { glyph = "\u{f07d3}", hl = "MiniIconsAzure" },
      -- go = { glyph = "\u{e724}" },
      [".nf"] = { glyph = "\u{f0c12}", hl = "MiniIconsGreen" },
    },
  },
}
