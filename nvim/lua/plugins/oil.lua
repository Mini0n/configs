return {
  "stevearc/oil.nvim",
  
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  
  opts = {},
  lazy = false,

  config = function()
    local oil = require("oil")
    oil.setup()

    -- launch keymap
    vim.keymap.set("n", "<localleader>--", oil.toggle_float, {})
  end,
}
