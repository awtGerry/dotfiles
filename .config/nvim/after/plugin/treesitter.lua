require'nvim-treesitter.configs'.setup {
    -- ensure_installed = { "help", "javascript", "typescript", "c", "rust" },
    sync_install = false,
    auto_install = true,
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
        -- disable = { "latex" },
        additional_vim_regex_highlighting = false,
    },
}
