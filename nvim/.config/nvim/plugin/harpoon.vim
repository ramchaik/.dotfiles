" Terminal commands
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-s> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><C-j> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><C-k> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><C-l> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><C-h> :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>tf :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent><leader>td :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent><leader>cf :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>cd :lua require("harpoon.term").sendCommand(1, 2)<CR>
