-- ======================================================================
-- Custom keymaps
-- ======================================================================

-- show diagnostics
vim.keymap.set("n", "<leader>ii", vim.diagnostic.open_float, { desc = "Show diagnostics" })
-- vim.keymap.set("n", "<leader>ia", vim.diagnostic.open_float({scope="buffer"}), { desc = "Show buffer diagnostics" })

-- rubocop autocorrect (LSP-aware)
vim.keymap.set('n', '<leader>ru', function()
  vim.lsp.buf.code_action({
    context = { only = { 'source.fixAll.rubocop' } },
    apply = true
  })
end, { desc = 'RuboCop LSP Autocorrect' })

-- Alternative: run rubocop autocorrect on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
  -- pattern = "*.rb",
  -- callback = function()
    -- Uncomment the next line if you want automatic rubocop fixes on save
    -- vim.lsp.buf.code_action({ context = { only = { 'source.fixAll.rubocop' } }, apply = true })
  -- end,
-- })
