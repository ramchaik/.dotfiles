local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
--
-- -- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
--
-- -- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
--
-- -- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
--
-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
--
-- -- Visual --
-- -- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)
--
-- -- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)
--
-- -- Visual Block --
-- -- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
--
-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- General
keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)
keymap("n", "<leader>Y", "gg\"+yG", opts)
keymap("n", "<leader>x", ":!chmod +x %<CR>", opts)

-- Quickfix List
keymap("n", "<A-[>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<A-]>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<A-q>", "<cmd>lua require(\"user.utils.quickfix\").toggle(1)<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Harpoon
keymap("n", "<leader>a", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>", opts)
keymap("n", "<C-s>", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>tc", "<cmd>lua require(\"harpoon.cmd-ui\").toggle_quick_menu()<CR>", opts)
--- Harpoon buffer hotkeys
keymap("n", "<C-j>", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>", opts)
keymap("n", "<C-l>", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>", opts)
--- Harpoon terminal hotkeys
keymap("n", "<leader>tf", "<cmd>lua require(\"harpoon.term\").gotoTerminal(1)<cr>", opts)
keymap("n", "<leader>td", "<cmd>lua require(\"harpoon.term\").gotoTerminal(2)<cr>", opts)
keymap("n", "<leader>ts", "<cmd>lua require(\"harpoon.term\").gotoTerminal(3)<cr>", opts)
keymap("n", "<leader>cf", "<cmd>lua require(\"harpoon.term\").sendCommand(1, 1)<cr>", opts)
keymap("n", "<leader>cd", "<cmd>lua require(\"harpoon.term\").sendCommand(2, 1)<cr>", opts)
keymap("n", "<leader>cs", "<cmd>lua require(\"harpoon.term\").sendCommand(3, 1)<cr>", opts)

-- Markdown
keymap("n", "<leader>sp", "<cmd>MarkdownPreviewToggle<cr>", opts)

keymap("n", "<leader>y", "\"+y", opts)
keymap("v","<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)
