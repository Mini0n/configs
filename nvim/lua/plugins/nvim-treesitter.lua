-- nvim treesiter configs
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/typecraft-dev/rails-neovim-config/blob/main/lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    enabled = true,
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,  -- auto install missing parsers when entering buffer
        highlight = {         -- use treesitter highlight
          enable = true,
          use_languagetree = true,
        },
        indent = { enable = false },  -- disable tresitter based indentation
        ensure_installed = {
          "typescript",
          "tsx"
        },
      })
    end,

    --enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    require("ts_context_commentstring").setup({}),
  }
}
