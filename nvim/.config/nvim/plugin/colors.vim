let g:ramchaik_colorscheme = "gruvbox"
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:ramchaik_colorscheme])
    else
        " TODO: What the way to use g:ramchaik_colorscheme
        colorscheme gruvbox
    endif

    " hi Normal guibg=none
    " highlight ColorColumn ctermbg=0 guibg=grey
    " hi SignColumn guibg=none ctermbg=none
    " hi CursorLineNR guibg=None ctermbg=None
    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    " highlight LineNr guifg=#5eacd3 
    " highlight netrwDir guifg=#5eacd3
    " highlight qfFileName guifg=#aed75f
    " hi TelescopeBorder guifg=#5eacd
    
    hi Normal ctermbg=none
    highlight ColorColumn ctermbg=7 guibg=Black
    hi SignColumn ctermbg=none
    hi CursorLineNR ctermbg=none
    highlight LineNr ctermfg=cyan
    highlight netrwDir ctermfg=cyan
    highlight qfFileName ctermfg=green
    hi TelescopeBorder cterm=bold ctermfg=cyan
endfun
call ColorMyPencils()

" Vim with me
nnoremap <leader>cmp :call ColorMyPencils()<CR>
nnoremap <leader>vwb :let g:ramchaik_colorscheme =
