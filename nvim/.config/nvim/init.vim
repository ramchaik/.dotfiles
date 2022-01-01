set scrolloff=8
set nu
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

call plug#begin('~/.vim/plugged')
" fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'honza/vim-snippets'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-commentary'
call plug#end()

" " color scheme & bg
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_selection='0'

" colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE

let mapleader = " "

" Custom
inoremap jk <Esc>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-[> :cnext<CR>
nnoremap <C-]> :cprev<CR>

" amazing stuff
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" lsp lua
lua <<EOF
  -- this is working one /lua dir is not working figure that out!! 
  require'lspconfig'.tsserver.setup{}
EOF

" cmp lua
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      --['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      --['<C-e>'] = cmp.mapping({
      --  i = cmp.mapping.abort(),
      --  c = cmp.mapping.close(),
      --}),
      --['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
EOF

" telescope lua
lua <<EOF
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

--require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")
--
local M = {}
--M.search_dotfiles = function()
--    require("telescope.builtin").find_files({
--        prompt_title = "< VimRC >",
--        cwd = vim.env.DOTFILES,
--        hidden = true,
--    })
--end
--
--local function set_background(content)
--    vim.fn.system(
--        "dconf write /org/mate/desktop/background/picture-filename \"'"
--            .. content
--            .. "'\""
--    )
--end
--
--local function select_background(prompt_bufnr, map)
--    local function set_the_background(close)
--        local content = require("telescope.actions.state").get_selected_entry(
--            prompt_bufnr
--        )
--        set_background(content.cwd .. "/" .. content.value)
--        if close then
--            require("telescope.actions").close(prompt_bufnr)
--        end
--    end
--
--    map("i", "<C-p>", function()
--        set_the_background()
--    end)
--
--    map("i", "<CR>", function()
--        set_the_background(true)
--    end)
--end
--
--local function image_selector(prompt, cwd)
--    return function()
--        require("telescope.builtin").find_files({
--            prompt_title = prompt,
--            cwd = cwd,
--
--            attach_mappings = function(prompt_bufnr, map)
--                select_background(prompt_bufnr, map)
--
--                -- Please continue mapping (attaching additional key maps):
--                -- Ctrl+n/p to move up and down the list.
--                return true
--            end,
--        })
--    end
--end
--
--M.anime_selector = image_selector("< Anime Bobs > ", "~/personal/anime")
--
--local function refactor(prompt_bufnr)
--    local content = require("telescope.actions.state").get_selected_entry(
--        prompt_bufnr
--    )
--    require("telescope.actions").close(prompt_bufnr)
--    require("refactoring").refactor(content.value)
--end
--
--M.refactors = function()
--    require("telescope.pickers").new({}, {
--        prompt_title = "refactors",
--        finder = require("telescope.finders").new_table({
--            results = require("refactoring").get_refactors(),
--        }),
--        sorter = require("telescope.config").values.generic_sorter({}),
--        attach_mappings = function(_, map)
--            map("i", "<CR>", refactor)
--            map("n", "<CR>", refactor)
--            return true
--        end,
--    }):find()
--end
--
--
M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end,
    })
end

--M.dev = function(opts)
--    opts = opts or {}
--
--    opts.cwd = opts.cwd or vim.loop.fs_realpath(vim.loop.cwd())
--    print("HEY BAE", opts.cwd)
--
--    local possible_files = vim.api.nvim_get_runtime_file(
--        "/lua/**/dev.lua",
--        true
--    )
--    local local_files = {}
--    for _, raw_f in ipairs(possible_files) do
--        local real_f = vim.loop.fs_realpath(raw_f)
--
--        if string.find(real_f, opts.cwd, 1, true) then
--            table.insert(local_files, real_f)
--        end
--    end
--
--    local dev = local_files[1]
--    local loaded = loadfile(dev)
--    local ok, mod = pcall(loaded)
--    if not ok then
--        print("===================================================")
--        print("HEY PRIME. YOUR CODE DOESNT WORK. THIS IS NOT ON ME")
--        print("===================================================")
--        return
--    end
--
--    -- P(mod)
--    local objs = {}
--    for k, v in pairs(mod) do
--        local debug_info = debug.getinfo(v)
--        table.insert(objs, {
--            filename = string.sub(debug_info.source, 2),
--            text = k,
--        })
--    end
--
--    local mod_name = vim.split(dev, "/lua/")
--    if #mod_name ~= 2 then
--        print("===================================================")
--        print("HEY PRIME. I DO NOT KNOW HOW TO FIND THIS FILE:")
--        print(dev)
--        print("===================================================")
--    end
--    mod_name = string.gsub(mod_name[2], ".lua$", "")
--    mod_name = string.gsub(mod_name, "/", ".")
--
--    pickers.new({
--        finder = finders.new_table({
--            results = objs,
--            entry_maker = function(entry)
--                return {
--                    value = entry,
--                    text = entry.text,
--                    display = entry.text,
--                    ordinal = entry.text,
--                    filename = entry.filename,
--                }
--            end,
--        }),
--        sorter = conf.generic_sorter(opts),
--        previewer = previewers.builtin.new(opts),
--        attach_mappings = function(_, map)
--            actions.select_default:replace(function(...)
--                -- print("SELECTED", vim.inspect(action_state.get_selected_entry()))
--                local entry = action_state.get_selected_entry()
--                actions.close(...)
--
--                mod[entry.value.text]()
--            end)
--
--            map("i", "<tab>", function(...)
--                local entry = action_state.get_selected_entry()
--                actions.close(...)
--
--                vim.schedule(function()
--                    -- vim.cmd(string.format([[normal!]], entry.value.text))
--                    vim.api.nvim_feedkeys(
--                        vim.api.nvim_replace_termcodes(
--                            string.format(
--                                "<esc>:lua require('%s').%s()",
--                                mod_name,
--                                entry.value.text
--                            ),
--                            true,
--                            false,
--                            true
--                        ),
--                        "n",
--                        true
--                    )
--                end)
--            end)
--
--            return true
--        end,
--    }):find()
--end
--
return M
EOF
