local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
    ignored_file_types = { -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    };
})

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

local lspkind = require("lspkind")
require('lspkind').init({
    with_text = true,
})

-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
             behavior = cmp.ConfirmBehavior.Insert,
             select = true
         }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end

    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'cmp_tabnine' },
        { name = 'buffer', keyword_length = 5 },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Setup lspconfig.
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup(config())

-- npm i -g vscode-langservers-extracted
require("lspconfig").eslint.setup(config())

-- npm i -g vscode-langservers-extracted
require("lspconfig").cssls.setup(config())

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls
-- npm install -g emmet-ls
require'lspconfig'.emmet_ls.setup(config())

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls 
-- curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
-- unzip elixir-ls.zip -d ~/elixir-ls
-- chmod +x ~/elixir-ls/language_server.sh
require'lspconfig'.elixirls.setup(config({
    cmd = { "~/elixir-ls/language_server.sh" };
}))

-- npm i -g @emacs-grammarly/unofficial-grammarly-language-server
require('lspconfig').grammarly.setup(config())

-- npm install -g dockerfile-language-server-nodejs
require('lspconfig').dockerls.setup(config())

-- npm i -g pyright
require'lspconfig'.pyright.setup(config())

require("lspconfig").solang.setup(config())

require("lspconfig").gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

-- for installation
-- https://rust-analyzer.github.io/manual.html#installation
require("lspconfig").rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer"},
}))

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})
