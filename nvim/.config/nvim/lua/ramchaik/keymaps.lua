-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- General
keymap("v", "J", ":m '>+1<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2<cr>gv=gv", opts)
keymap("n", "<leader>Y", "gg\"+yG", opts)
keymap("n", "<leader>x", ":!chmod +x %<CR>", opts)

-- Quickfix List
keymap("n", "<A-[>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<A-]>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<A-q>", "<cmd>lua require(\"ramchaik.utils.quickfix\").toggle(1)<CR>", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep hidden=true<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>fs",
  function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > "), hidden = true })
  end, opts)
keymap("n", "<leader>fw",
  function()
    require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>"), hidden = true })
  end, opts)
keymap("n", "<leader>fW",
  function()
    require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>"), hidden = true })
  end, opts)
keymap("n", "<leader>fm", function()
  require("telescope.builtin").marks()
end, opts)
keymap("n", "<leader>sk", function()
  require("telescope.builtin").keymaps()
end, opts)
keymap("n", "<leader>sc", function()
  require("telescope.builtin").commands()
end, opts)
keymap("n", "<leader>sm", function()
  require("telescope.builtin").man_pages()
end, opts)
keymap("n", "<leader>sr", function()
  require("telescope.builtin").registers()
end, opts)
keymap("n", "<leader>san", function()
  require("telescope").extensions.notify.notify()
end, opts)
keymap("n", "<leader>src", function()
  require('ramchaik.telescope').search_dotfiles()
end, opts)

-- Telescope LSP (check the lsp config for the keymaps)
keymap("n", "<leader>ss", function()
  require("telescope.builtin").lsp_document_symbols()
end, opts)
keymap("n", "<leader>fr", function()
  require("telescope.builtin").lsp_references()
end, opts)
keymap("n", "<leader>sad", function()
  require("telescope.builtin").diagnostics()
end, opts)
keymap("n", "<leader>fws", function()
  require'telescope.builtin'.lsp_workspace_symbols({ query = vim.fn.input("Grep Symbols > ") })
end, opts)


--- Git Worktree
keymap("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
keymap("n", "<leader>gwm", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

--- Git Signs
keymap("n", "<leader>gl", function()
  require("gitsigns").blame_line()
end, opts)
keymap("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, opts)
keymap("n", "<leader>gh", function()
  require("gitsigns").reset_hunk()
end, opts)
keymap("n", "<leader>gr", function()
  require("gitsigns").reset_buffer()
end, opts)
keymap("n", "<leader>gs", function()
  require("gitsigns").stage_hunk()
end, opts)
keymap("n", "<leader>gu", function()
  require("gitsigns").undo_stage_hunk()
end, opts)
keymap("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

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

-- Sessions
keymap("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>", opts)
keymap("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>", opts)
keymap("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>", opts)
keymap("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>", opts)
keymap( "n", "<leader>S.", "<cmd>SessionManager! load_current_dir_session<cr>", opts)

