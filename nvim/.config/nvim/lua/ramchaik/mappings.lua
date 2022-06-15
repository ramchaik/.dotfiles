local map = vim.keymap.set

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")
map("n", "<leader>Y", "gg\"+yG")
map("n", "<leader>x", ":!chmod +x %<CR>")

-- Quickfix List
map("n", "<A-[>", "<cmd>cnext<CR>zz")
map("n", "<A-]>", "<cmd>cprev<CR>zz")
map("n", "<A-q>", "<cmd>lua require(\"ramchaik.quickfix\").toggle(1)<CR>")


map("n", "jk", "<Esc>")