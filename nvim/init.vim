" ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
" init.vim
"
" Neovim configuration file
" by @mini0n
"
" Tested w/ NVIM v0.9.5 @ ubuntu 24.04.02 LTS
"
" > init_update: 17.Apr.2025
" ==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==


set showmatch 			        " show mathching
set ignorecase			        " case insensitive
set hlsearch			          " highlight search
set incsearch			          " incremental search
set tabstop=2			          " number of columns per tab
set softtabstop=2		        " see multiple spaces as tabstops
set expandtab			          " convert tabs to spaces
set shiftwidth=2		        " width for autoindent
set autoindent			        " autoindent new lines
set number			            " show line numbers
set wildmode=longest,list   " get bash-like completitions
" set cc=100			            " set a 100 column boder for better coding style
filetype plugin indent on	  " allow auto-indenting depending on file type
syntax on			              " syntax highlighting
set mouse=a			            " enable mouse click
set clipboard=unnamedplus	  " use system clipboard
filetype plugin on
set cursorline			        " highlight current cursor line
set ttyfast			            " Speed up scrolling in Vim

