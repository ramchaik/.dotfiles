nnoremap <leader>[ :cnext<CR>zz
nnoremap <leader>] :cprev<CR>zz
" nnoremap <leader>[ :lnext<CR>zz
" nnoremap <leader>] :lprev<CR>zz
" nnoremap <C-q> :call ToggleQFList(1)<CR>
" nnoremap <leader>q :call ToggleQFList(0)<CR>

" let g:ramchaik_qf_l = 0
" let g:ramchaik_qf_g = 0

" fun! ToggleQFList(global)
"     if a:global
"         if g:ramchaik_qf_g == 1
"             let g:ramchaik_qf_g = 0
"             cclose
"         else
"             let g:ramchaik_qf_g = 1
"             copen
"         end
"     else
"         if g:ramchaik_qf_l == 1
"             let g:ramchaik_qf_l = 0
"             lclose
"         else
"             let g:ramchaik_qf_l = 1
"             lopen
"         end
"     endif
" endfun
