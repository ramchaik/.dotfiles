require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"phpdoc"},
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = {"lua"}
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    textobjects = {
        enable = true
    }
}

