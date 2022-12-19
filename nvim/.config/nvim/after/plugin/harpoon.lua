local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-s>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end)

vim.keymap.set("n", "<leader>tf", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>td", function() term.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>ts", function() term.gotoTerminal(3) end)



