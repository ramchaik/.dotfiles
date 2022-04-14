lua require("ramchaik")

lua require("refactoring").setup({})

vnoremap <silent> <leader>ro :lua require("ramchaik.telescope").refactors()<CR>
nnoremap <silent> <leader>ro :lua require("ramchaik.telescope").refactors()<CR>

nnoremap <silent> <leader>rP :lua require("refactoring").debug.printf({below = false})<CR>
nnoremap <silent> <leader>rp :lua require("refactoring").debug.printf({below = true})<CR>

vnoremap <silent> <leader>rp :lua require("refactoring").debug.print_var({})<CR>

nnoremap <silent> <leader>rc :lua require("refactoring").debug.cleanup({})<CR>

