return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", lazy = false },
      { "hrsh7th/cmp-buffer", lazy = false },
      { "hrsh7th/nvim-cmp", lazy = false },
      { "williamboman/mason-lspconfig.nvim", lazy = false },
    },
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('ruby_lsp', {
        capabilities = capabilities,
        cmd = { 'bundle', 'exec', 'ruby-lsp' },
        root_dir = vim.fn.getcwd(),
        settings = {
          ruby_lsp = {
            formatter = 'rubocop',
            linters = { 'rubocop' }
          }
        }
      })
      vim.lsp.enable('ruby_lsp')

      -- TypeScript LSP
      vim.lsp.config('ts_ls', {
        capabilities = capabilities
      })
      vim.lsp.enable('ts_ls')

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

      -- Additional Ruby-specific LSP keymaps
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
      vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
      vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
    end,
  },
}
