require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "css", "dockerfile", "go", "html", "java", "javascript", "lua", "python", "query",
        "typescript", "vim", "vimdoc"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
