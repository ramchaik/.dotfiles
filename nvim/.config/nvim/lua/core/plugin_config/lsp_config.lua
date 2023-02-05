require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'sumneko_lua',
        'rust_analyzer',
        'tsserver',
        'pyright',
        'yamlls',
    }
})

local on_attach = function(_, _)
    local opts = {}
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

    vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', opts)
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').lsp_document_symbols, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities

}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').yamlls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
