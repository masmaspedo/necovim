require 'nvim-treesitter.configs'.setup {
    ensure_installed = { 'markdown', 'markdown_inline' },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        disable = {"dart"}
    },
    indent = {
        enable = true,
        disable = {"dart"}
    }
}

