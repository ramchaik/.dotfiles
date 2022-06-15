local map = vim.keymap.set

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
    excluded_filetypes = {"harpoon"}
    -- projects = {
    --     -- Yes $HOME works
    --     ["$HOME/personal/vim-with-me/server"] = {
    --         term = {
    --             cmds = {
    --                 "./env && npx ts-node src/index.ts"
    --             }
    --         }
    --     }
    -- }
})

-- Harpoon
map("n", "<leader>a", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>")
map("n", "<C-s>", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
---- Harpoon buffer hotkeys
map("n", "<C-j>", "<cmd>lua require(\"harpoon.ui\").nav_file(1)<CR>")
map("n", "<C-k>", "<cmd>lua require(\"harpoon.ui\").nav_file(2)<CR>")
map("n", "<C-l>", "<cmd>lua require(\"harpoon.ui\").nav_file(3)<CR>")
---- Harpoon terminal hotkeys
map("n", "<leader>tf", "<cmd>lua require(\"harpoon.term\").gotoTerminal(1)<CR>")
map("n", "<leader>td", "<cmd>lua require(\"harpoon.term\").gotoTerminal(2)<CR>")
map("n", "<leader>ts", "<cmd>lua require(\"harpoon.term\").gotoTerminal(3)<CR>")
