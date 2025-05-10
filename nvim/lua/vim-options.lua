-- ======================================================================
-- NVim general configs
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
-- vim.cmd("set syntax on")               -- syntax highlighting
vim.cmd("set cc=100")                  -- set a 100 column boder for better coding style

-- Search configs
vim.cmd("set ignorecase")               -- case insensitive
vim.cmd("set hlsearch ")                -- highlight search
vim.cmd("set incsearch")                -- incremental search

-- Clipboard configs
vim.cmd("set clipboard=unnamedplus")    -- use system clipboard

-- Winbar configs
vim.cmd("set winbar=%=%m\\ %f\\ %r ")   -- winbar info
vim.cmd("set laststatus=3")             -- only one statusbar for all windows


-- Autosaving config
vim.api.nvim_create_autocmd({"FocusLost", "TextChanged", "InsertLeave"}, {
  pattern = '*', -- Apply to all buffers
  command = 'silent! w', -- Save the buffer silently
})


-- Stuff to review -----------------------------------------------------------------------

--vim.cmd("set wildmode=longest,list")   -- get bash-like completitions
--vim.cmd("set mouse=a")                 -- enable mouse click
--vim.cmd("set ttyfast")                 -- Speed up scrolling in Vim
--vim.cmd("filetype plugin on")
--vim.cmd("filetype plugin indent on")   -- allow auto-indentin
