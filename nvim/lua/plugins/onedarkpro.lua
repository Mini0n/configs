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
        --[ Based on original bg color ]
        -- bg = "#282c34", -- original bg color
        bg = "#21252b",    -- darker 1 bg color
        -- bg = "#16181d", -- darker 2 bg color
        -- bg = "#0b0c0e", -- darker 3 bg color

        -- [ Dark grey ]
        -- bg = "#1b1e23"  -- dark grey
      }
    }
  }

}
