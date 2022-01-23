nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
" Git
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gc :lua require('ramchaik.telescope').git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
" Custom
nnoremap <leader>vrc :lua require('ramchaik.telescope').search_dotfiles({ hidden = true })<CR>
nnoremap <leader>va :lua require('ramchaik.telescope').anime_selector()<CR>
