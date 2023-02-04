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
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TODO: refactor the setup function for each lsp

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
