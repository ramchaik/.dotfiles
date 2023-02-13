local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', function()
   builtin.git_files({ hidden = true, previewer = false })
end, {})

vim.keymap.set('n', '<leader>ff', function() 
    builtin.find_files({ hidden = true, previewer = false })
end, {})

vim.keymap.set('n', '<leader><leader>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>sw', function()
    builtin.grep_string({ 
        search = vim.fn.input("Grep > "), 
        hidden = true, 
        previewer = false 
    })
end)

vim.keymap.set("n", "<leader>fw", function()
    builtin.grep_string({ 
        search = vim.fn.expand("<cword>"), 
        hidden = true, 
        previewer = false 
    })
end, {})

vim.keymap.set("n", "<leader>fW", function()
    builtin.grep_string({ 
        search = vim.fn.expand("<cWORD>"), 
        hidden = true, 
        previewer = false 
    })
end, {})
