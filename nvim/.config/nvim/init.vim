"Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')
"
" fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" LSP
Plug 'neovim/nvim-lspconfig'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'simrat39/symbols-outline.nvim'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'


" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'

Plug 'github/copilot.vim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Refactoring
Plug 'ThePrimeagen/refactoring.nvim'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'theprimeagen/harpoon'

Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'theprimeagen/git-worktree.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'mbbill/undotree'
Plug 'tpope/vim-rhubarb'
Plug 'vim-utils/vim-man'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Vim session
Plug 'tpope/vim-obsession'

" Prettier
Plug 'sbdchd/neoformat'

Plug 'vuciv/vim-bujo'
"
call plug#end()

" lua
lua require'ramchaik'

 " Remaps
let mapleader = " "

nmap <Leader>toa <Plug>BujoChecknormal
nmap <Leader>tod <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Custom
nnoremap <leader>pv :Ex<CR>
nnoremap <silent> <C-f> :silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

"vim session with obsession
nnoremap <Leader>ss :Obsession<CR>  " Start Session
nnoremap <Leader>se :Obsession!<CR> " End Session

" amazing stuff
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>x :!chmod +x %<CR>
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

tnoremap <Esc> <C-\><C-n>
inoremap jk <Esc>
inoremap <C-c> <esc>

