-- ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- init.vim
--
-- Neovim configuration files
-- by @mini0n
--
-- Tested w/ NVIM v0.11.0 @ ubuntu 24.04.02 LTS
--
-- > last_update: 31.May.2025
-- > init_update: 17.Apr.2025
-- ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==

-- Load Nvim configs
require("vim-options")

-- Load lazy.nvim
require("config.lazy")
require("keymaps")

-- Load theme
vim.cmd("colorscheme onedark_vivid")

-- set colorcolum and listchars highlight colors
-- this cmds need to go after the colorscheme cmd
-- to yield effect. Or create a function to set
-- them after theme change.
-- https://neovim.io/doc/user/options.html#'listchars'
vim.cmd("highlight NonText guifg=#393d46")
vim.cmd("highlight Whitespace guifg=#393d46")
vim.cmd("highlight ColorColumn guibg=#2e3138")
