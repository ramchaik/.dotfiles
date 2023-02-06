require("rose-pine").setup()

vim.o.termguicolors = true

vim.cmd('colorscheme rose-pine')

-- Transparent BG
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

