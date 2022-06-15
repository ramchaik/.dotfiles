-- require('ramchaik')

return require('packer').startup(function()

use 'neovim/nvim-lspconfig'

-- " Completion
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lua'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'hrsh7th/cmp-cmdline'
use 'tzachar/cmp-tabnine'
use 'onsails/lspkind-nvim'
use 'glepnir/lspsaga.nvim'

-- " For luasnip users.
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'
use 'simrat39/symbols-outline.nvim'


-- " Lang Syntax hilighters & Formatters
use 'rust-lang/rust.vim'
use 'darrikonn/vim-gofmt'
-- " Template engines
use 'digitaltoad/vim-pug'
use 'mustache/vim-mustache-handlebars'

use 'github/copilot.vim'

-- " Neovim Tree shitter
use 'nvim-treesitter/nvim-treesitter'
use 'nvim-treesitter/playground'

-- " Refactoring
-- use 'ThePrimeagen/refactoring.nvim'

-- " Debugger useins
use 'puremourning/vimspector'
use 'szw/vim-maximizer'

-- " telescope
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
-- use 'nvim-telescope/telescope.nvim'
use 'nvim-telescope/telescope-fzy-native.nvim'

use 'theprimeagen/harpoon'

use 'numToStr/Comment.nvim'
use 'tpope/vim-surround'
use 'tpope/vim-dispatch'

-- " Git
use 'tpope/vim-fugitive'
use 'junegunn/gv.vim'
use 'theprimeagen/git-worktree.nvim'
use 'lewis6991/gitsigns.nvim'

use 'mbbill/undotree'
use 'tpope/vim-rhubarb'
use 'vim-utils/vim-man'
use 'theprimeagen/vim-be-good'
use 'gruvbox-community/gruvbox'

use 'hoob3rt/lualine.nvim'
use 'kyazdani42/nvim-web-devicons'

use 'tpope/vim-eunuch'

-- " Vim session
use 'tpope/vim-obsession'

-- " Prettier
use 'sbdchd/neoformat'

-- " auto-detect indent heuristically
use 'tpope/vim-sleuth'

    use 'folke/todo-comments.nvim'

    use 'aserebryakov/vim-todo-lists'
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    -- use 'nvim-treesitter/nvim-treesitter'
    use 'tpope/vim-commentary'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {"nvim-telescope/telescope-file-browser.nvim"}
    use {
        "blackCauldron7/surround.nvim",
        config = function()
            require"surround".setup {
                mappings_style = "surround"
            }
        end
    }

    local map = vim.keymap.set
    map("n", "<leader>pc", "<cmd>PackerCompile<cr>", {
        desc = "Packer compile"
    })
    map("n", "<leader>pi", "<cmd>PackerInstall<cr>", {
        desc = "Packer install"
    })
    map("n", "<leader>ps", "<cmd>PackerSync<cr>", {
        desc = "Packer sync"
    })
    map("n", "<leader>pS", "<cmd>PackerStatus<cr>", {
        desc = "Packer status"
    })
    map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", {
        desc = "Packer update"
    })
end)
