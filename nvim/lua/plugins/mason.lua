return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
      })
    end,
  },
}
