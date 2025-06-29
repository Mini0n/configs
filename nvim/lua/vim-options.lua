-- ======================================================================
-- Neo(vim) configs & options
-- ======================================================================

-- `mapleader` and `maplocalleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Tab Configs
vim.cmd("set expandtab")                -- convert tabs to spaces
vim.cmd("set tabstop=2")                -- number of columns per tab
vim.cmd("set softtabstop=2")            -- see multiple spaces as tabstops
vim.cmd("set shiftwidth=2")             -- width for autoindent

-- Code helpers
vim.cmd("set number")                   -- show line numbers
vim.cmd("set showmatch")                -- show matching brackets
vim.cmd("set autoindent")               -- autoindent new lines
vim.cmd("set cursorline")               -- highlight current cursor line
vim.cmd("set colorcolumn=120")          -- set a color column @ 120 for better coding style
vim.cmd("set list")                     -- show tabs, spaces and non-breakable characters
vim.cmd("set listchars+=trail:·")       -- add show trailing spaces as dots "·"
vim.cmd("set listchars+=lead:·")        -- add show leading spaces as dots "·"
-- colorcolum and listchars colors setted @ vim-options.lua

-- Code folding
-- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
vim.opt.foldmethod = "expr"                           -- fold by expression
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"  -- use treesitter for folding
vim.opt.foldtext = ""                                 -- no especial fold string
vim.opt.foldlevel = 999                               -- start with all folds open
vim.opt.foldnestmax = 4                               -- stop folding after the 4th fold

-- Search configs
vim.cmd("set ignorecase")               -- case insensitive
vim.cmd("set hlsearch ")                -- highlight search
vim.cmd("set incsearch")                -- incremental search

-- Clipboard configs
vim.cmd("set clipboard=unnamedplus")    -- use system clipboard

-- Winbar configs
vim.cmd("set winbar=%=%m\\ %f\\ %r ")   -- winbar info
vim.cmd("set laststatus=3")             -- only one statusbar for all windows

-- Exit insert mode when focus is lost
vim.api.nvim_create_autocmd({"FocusLost", "BufLeave"}, {
  pattern = '*',          -- Apply to all buffers
  command = 'stopinsert', -- Exit insert mode
})

-- Autosave
vim.api.nvim_create_autocmd({"InsertLeave", "FocusLost", "BufLeave"}, {
  pattern = '*',         -- Apply to all buffers
  command = 'silent! w', -- Save the buffer silently
})
