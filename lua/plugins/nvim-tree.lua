local tree = require 'nvim-tree'
tree.setup {
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 32
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
}
vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])
