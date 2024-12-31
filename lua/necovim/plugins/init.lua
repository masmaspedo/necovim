return {
    -- Core Plugins 
    { 'wbthomason/packer.nvim' }, -- core packer
    -- Interface 
    { 'rebelot/kanagawa.nvim' }, -- default theme will be catpuccin for all necovim themes
    { 'DaikyXendo/nvim-material-icon' }, -- icons
    { 'norcalli/nvim-colorizer.lua' }, -- colorizer
    { 'nvimdev/dashboard-nvim' },
    { 'hoob3rt/lualine.nvim' },
    { 'akinsho/bufferline.nvim' },
    { 'HiPhish/rainbow-delimiters.nvim' }, -- rainbow delimiters
    { 'lukas-reineke/indent-blankline.nvim' }, -- indentline
    { 
        'xiyaowong/transparent.nvim',
        config=function()
            require'transparent'.setup{}
            -- enable transparent
            vim.cmd([[autocmd BufEnter * ++once lua require("transparent").TransparentEnable]])
        end

    },
    -- Utilities 
    { 'nvim-tree/nvim-tree.lua' }, -- file tree
    { 'nvim-lua/plenary.nvim' }, -- async utilities
    { 'nvim-telescope/telescope.nvim' }, -- telescope
    { 'windwp/nvim-autopairs' }, -- autopairs
    { 'windwp/nvim-ts-autotag' }, -- ts autoclosetags
    -- Developments 
    { 'tpope/vim-fugitive' }, -- git integration
    { 'lewis6991/gitsigns.nvim' }, -- git integration
    { 'nvim-treesitter/nvim-treesitter' }, -- code highlighter
    -- lsp yara yara
    { 'Exafunction/codeium.nvim' }, -- AI Completion
    { 'neovim/nvim-lspconfig' }, -- lspconfig
    { 'hrsh7th/cmp-nvim-lsp' }, -- new completion
    { 'hrsh7th/cmp-buffer' }, -- new completion
    { 'hrsh7th/cmp-path' }, -- new completion
    { 'hrsh7th/cmp-cmdline' }, -- new completion
    { 'hrsh7th/nvim-cmp' }, -- new completion
    { 'williamboman/mason-lspconfig.nvim' }, -- mason lsp config
    { 'williamboman/mason.nvim' }, -- lsp auto installer
    { 'onsails/lspkind-nvim' }, -- lsp kind
    { 'lukas-reineke/lsp-format.nvim' }, -- autoformatter
    { 'nvimdev/lspsaga.nvim' }, -- lsp saga
    { 'L3MON4D3/LuaSnip' }, -- lua snippet
    { 'saadparwaiz1/cmp_luasnip' }, -- cmp lua snippet
    -- debuging yara yara..
    { 'folke/trouble.nvim' }, -- trouble vim
    { 'ray-x/lsp_signature.nvim' }, -- lsp signature
    -- Quality of Life 
    { 'psliwka/vim-smoothie' }, -- smooth scroll
    { 'folke/todo-comments.nvim' }, -- todo comment
    { 'folke/flash.nvim' }, -- flash
    { 'danymat/neogen' }, -- neogen for code docsgen
}
