local load = {}

load.core = {
    { 'wbthomason/packer.nvim' }, -- packer
    { 'nvim-lua/plenary.nvim' }, -- plenary plugins
    { 'ryanoasis/vim-devicons' }, -- vim icons
    { 'norcalli/nvim-colorizer.lua' }, -- colorizer
    { 'tpope/vim-fugitive' }, -- git utils
    { 'lewis6991/gitsigns.nvim' },
    { 'cohama/lexima.vim' }, -- autoclose plugins
    { 'kyazdani42/nvim-tree.lua', 'preservim/nerdcommenter' }, -- file & commenter
    { 'preservim/tagbar' }, -- tagbar
    { 'nvim-telescope/telescope.nvim' }, -- telescope
    { 'glepnir/dashboard-nvim', requires = { "nvim-tree/nvim-web-devicons" } }, -- dashboard
    { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }, -- bar plugins
    { 'akinsho/bufferline.nvim' }, -- tabline plugins
    { 'psliwka/vim-smoothie' }, -- smooth scrolls
    { 'nvim-treesitter/nvim-treesitter' }, -- treesitter forked | temporary use this forks for full working with dart code.
    { 'neovim/nvim-lspconfig' }, -- lspconfig
    { 'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
            'octaltree/cmp-look', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp-signature-help' } }, -- new completion
    { 'nvimdev/lspsaga.nvim' }, -- lsp saga
    { 'folke/trouble.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }, -- trouble vim
    { 'onsails/lspkind-nvim' }, -- lsp kind
    { 'folke/which-key.nvim' }, -- whichkey
    { 'williamboman/mason.nvim', requires = { 'williamboman/mason-lspconfig.nvim'  } }, -- lsp auto installer
    { 'lukas-reineke/lsp-format.nvim' }, -- autoformatter
    { 'ray-x/lsp_signature.nvim' }, -- lsp signature
    { 'khaveesh/vim-fish-syntax' }, -- fish shell highlighting
    { 'vimwiki/vimwiki' }, -- wiki plugins use as notes
    { 
        'lukas-reineke/indent-blankline.nvim', 
        -- requires = { 'HiPhish/rainbow-delimiters.nvim' }
    }, -- indent blank line
    { 'matze/vim-move' }, -- move line
    { 'francoiscabrol/ranger.vim' }, -- vim ranger
    { 'jghauser/mkdir.nvim', config = function() require 'mkdir' end }, -- makedir when folder not exist
    { 'itchyny/calendar.vim' }, -- calendar
    { 'windwp/nvim-autopairs', requires = { 'hrsh7th/nvim-cmp' } },
    { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
        require("toggleterm").setup()
    end },
    { 'rcarriga/nvim-notify' }, -- notify
    { 'natecraddock/sessions.nvim', requires = { 'rcarriga/nvim-notify' } }, -- session manager
    { 'j-hui/fidget.nvim', branch = 'legacy' }, -- Eye candy for the impatient
    { 'jceb/vim-orgmode', requires = { 'tpope/vim-speeddating' } }, -- Org Mode
    { 'windwp/nvim-ts-autotag' }, -- autoclose tag
    -- copilot alternative
    {
        'akinsho/flutter-tools.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    },
    -- transparent
    { 'xiyaowong/transparent.nvim', config = function()
        require 'transparent'.setup {  } 
        -- set transparent on start
        -- vim.cmd([[autocmd BufEnter * ++once lua require("transparent").TransparentEnable]])
    end },
    -- add zen mode
    { 'folke/zen-mode.nvim' },
}


function load.load(bootstrap, users)
    require 'packer'.startup(function(use)
        for _, item in ipairs(load.core) do
            use(item)
        end
        for _, item in ipairs(users) do
            use(item)
        end
        if bootstrap then
            require 'packer'.sync()
        end
    end)
end

function load.config(bootstrap, opt)
    if not bootstrap then
        for _, item in ipairs(opt) do
            item()
        end
    end
end

return load
