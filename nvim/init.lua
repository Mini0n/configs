-- ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- init.vim
--
-- Neovim configuration file
-- by @mini0n
--
-- Tested w/ NVIM v0.9.5 @ ubuntu 24.04.02 LTS
--
-- > last_uptate: 01.May.2025
-- > init_update: 17.Apr.2025
-- ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==


-- Load vim configs
require("vim-options")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load lazy.nvim
require("config.lazy")

-- Load theme
vim.cmd("colorscheme onedark_vivid")


