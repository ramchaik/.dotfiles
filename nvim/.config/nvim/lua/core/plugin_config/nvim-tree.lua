-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
    view = {
        side = 'right'
    },
    git = {
        ignore = false,
    }
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>')
