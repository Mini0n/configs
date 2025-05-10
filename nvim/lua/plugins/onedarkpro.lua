return {
  "olimorris/onedarkpro.nvim",
  -- tag = 'v2.14.0',
  name = "onedarkpro",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins

  -- configuration
  opts = {
    colors = {
      onedark_vivid = {
        -- bg = "#282c34", -- original
        bg = "#21252b", -- darker 1
        -- bg = "#16181d", -- darker 2
        -- bg = "#0b0c0e", -- darker 3
      }
    }
  }

}
