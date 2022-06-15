-- vim dotoo
-- vim.cmd([[ let g:dotoo#agenda#files="~/my-org/**/*.dotoo"]])
vim.cmd([[ let g:dotoo#agenda#files=["~/my-org/*.dotoo"] ]])
vim.cmd([[ let g:dotoo#capture#refile=expand("~/my-org/refile.dotoo") ]])

vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 2
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 8
vim.o.errorbells = false
vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.colorcolumn = '80'
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'

local map = vim.keymap.set
map("t", "<Esc>", "<C-\\><C-n>", {silent = true})

