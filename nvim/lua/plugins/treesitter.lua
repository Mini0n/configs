-- nvim treesiter configs
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/typecraft-dev/rails-neovim-config/blob/main/lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,            -- auto install missing parsers when entering buffer
        highlight = { enable = true },  -- use treesitter highlight
        indent = { enable = false },    -- disable tresitter based indentation 
      })
    end
  }
}
