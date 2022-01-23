lua require("ramchaik")

lua require("refactoring").setup({})

vnoremap <silent> <leader>rr :lua require("ramchaik.telescope").refactors()<CR>
nnoremap <silent> <leader>rr :lua require("ramchaik.telescope").refactors()<CR>
nnoremap <silent> <leader>dL :lua require("refactoring").debug.printf({below = false})<CR>
nnoremap <silent> <leader>dl :lua require("refactoring").debug.printf({below = true})<CR>

