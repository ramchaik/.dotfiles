local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ hidden = true, previewer = false})
end, {})
vim.keymap.set('n', '<C-p>', function ()
    builtin.git_files({ previewer = false })
end
, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > "), hidden = true, previewer = false })
end)
vim.keymap.set("n", "<leader>psw", function()
    builtin.grep_string({ search = vim.fn.expand("<cword>"), hidden = true, previewer = false })
end, {})
vim.keymap.set("n", "<leader>psW", function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>"), hidden = true, previewer = false })
end, {})