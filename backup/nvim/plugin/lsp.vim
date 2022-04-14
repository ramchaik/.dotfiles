set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>gT :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>

nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>

nnoremap <leader>K :lua vim.lsp.buf.hover()<CR>

nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>

nnoremap <leader>ds :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>dn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dp :lua vim.diagnostic.goto_prev()<CR>

nnoremap <leader>rr :LspRestart<CR>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
