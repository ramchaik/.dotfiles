require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "lua",
        "rust",
        "vim",
        "javascript",
        "typescript",
        "html",
        "css",
        "json"
    },
    sync_install = false,
    auto_install = true,
    hightlight = {
        enable = true
    }
}
