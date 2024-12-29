local M = {}

M.config = {
    function()
        require'necovim.plugins.nvim-tree'
        require'necovim.plugins.git'
        require'necovim.plugins.dashboard'
        require'necovim.plugins.bufferline'
        require'necovim.plugins.lualine'
    end
}

M.core = {
    -- Core Plugins 
    { 'wbthomason/packer.nvim' }, -- core packer
    -- Interface 
    { 'catppuccin/nvim' }, -- default theme will be catpuccin for all necovim themes
    { 'DaikyXendo/nvim-material-icon' }, -- icons
    { 'norcalli/nvim-colorizer.lua' }, -- colorizer
    { 'nvimdev/dashboard-nvim' },
    { 'hoob3rt/lualine.nvim' },
    { 'akinsho/bufferline.nvim' },
    -- Utilities 
    { 'nvim-tree/nvim-tree.lua' }, -- file tree
    { 'nvim-lua/plenary.nvim' }, -- async utilities
    { 'nvim-telescope/telescope.nvim' }, -- telescope
    -- Developments 
    { 'tpope/vim-fugitive' }, -- git integration
    { 'lewis6991/gitsigns.nvim' }, -- git integration
    -- Quality of Life 
}

return M

