
require("harpoon").setup({
    nav_first_in_list = true,
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },
})

local keymap = vim.keymap.set

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
