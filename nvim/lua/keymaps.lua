-- show diagnostics
vim.keymap.set("n", "<leader>ii", vim.diagnostic.open_float, { desc = "Show diagnostics" })
-- vim.keymap.set("n", "<leader>ii", vim.diagnostic.open_float({scope="buffer"}), {})


-- rubocop autocorrect
vim.keymap.set('n', '<leader>ru', function()
  vim.cmd('w') -- Save the current buffer
  vim.cmd('!rubocop -A %') -- Run RuboCop autocorrect on the current file (%)
end, { desc = 'RuboCop Autocorrect' })
