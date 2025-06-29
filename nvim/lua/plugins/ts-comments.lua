-- ts-comments.nvim
-- Tiny plugin to enhance Neovim's native comments
-- https://github.com/folke/ts-comments.nvim
-- pt

return {
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
