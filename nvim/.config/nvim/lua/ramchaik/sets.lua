-- Vim dotoo
-- vim.cmd([[ let g:dotoo#agenda#files="~/my-org/**/*.dotoo"]])
vim.cmd([[ let g:dotoo#agenda#files=["~/my-org/*.dotoo"] ]])
vim.cmd([[ let g:dotoo#capture#refile=expand("~/my-org/refile.dotoo") ]])

-- Scratch
vim.cmd([[ let g:scratch_insert_autohide = 0 ]])
vim.cmd([[ let g:scratch_height = 30 ]])
vim.cmd([[ let g:scratch_top = 1 ]])
vim.cmd([[ let g:scratch_persistence_file = '/tmp/scratch.md' ]])
vim.cmd([[ let g:scratch_persistence_file = '.scratch.md' ]])

-- set bg highlight
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])

-- Vim Wiki
vim.cmd([[ let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}] ]])
