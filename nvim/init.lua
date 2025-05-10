-- ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
-- init.vim
--
-- Neovim configuration files
-- by @mini0n
--
-- Tested w/ NVIM v0.9.5 @ ubuntu 24.04.02 LTS
--
-- > last_update: 10.May.2025
-- > init_update: 17.Apr.2025
-- ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==


-- Load Nvim configs
require("vim-options")

-- Load lazy.nvim
require("config.lazy")
require("keymaps")

-- Load theme
vim.cmd("colorscheme onedark_vivid")
