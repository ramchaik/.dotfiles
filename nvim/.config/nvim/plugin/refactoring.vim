lua require("ramchaik")

lua require("refactoring").setup({})

vnoremap <silent> <leader>ro :lua require("ramchaik.telescope").refactors()<CR>
nnoremap <silent> <leader>ro :lua require("ramchaik.telescope").refactors()<CR>
nnoremap <silent> <leader>Ld :lua require("refactoring").debug.printf({below = false})<CR>
nnoremap <silent> <leader>ld :lua require("refactoring").debug.printf({below = true})<CR>

