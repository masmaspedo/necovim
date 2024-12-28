local config = require 'necovim.config'

-- plugins
config.plugins = {
    { 'junegunn/seoul256.vim' },
    { "ellisonleao/gruvbox.nvim" },
    { "ayu-theme/ayu-vim" },
    { "tiagovla/tokyodark.nvim" },
    { "bluespada/justblack.vim" },
    -- { 'Exafunction/codeium.vim', requires = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' }},
    -- { "wakatime/vim-wakatime" },
    { "Djancyp/better-comments.nvim", config = function()
    end },
    { "nobbmaestro/nvim-andromeda", requires = { "tjdevries/colorbuddy.nvim", branch = "dev" } },
    { "navarasu/onedark.nvim" }
}
-- colorscheme
config.colorscheme = 'onedark'
config.init = function()
    -- NOTE: MY CUSTOM CONFIGURATION THEME DEFAULT WILL USE ANDROMEDA THEME
    local onedark = require 'onedark'
    onedark.setup {
        style = "dark"
    }
    onedark.load()
    -- make a function to add number 
    function add_somenumber(a, b)
    end

    -- NOTE : SET CMP COLOR
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3E4451", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#ABB2BF", bg = "#282C34" })

    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

    vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { bg = "#56B6C2", fg = "#EED8DA", bold = true })

    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
    vim.api.nvim_set_hl(0, "cmpItemKindKeyword", { fg = "#c3e88d", bg = "#9fbd73" })

    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })

    -- NOTE: custom configuration here

    vim.cmd([[autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE]])
    -- NOTE: configuration for neovide
    if vim.g.neovide then
        -- set fontsize of neovide
        vim.o.guifont = "MonoLisa Nerd Font Mono:h11.5"
        -- set text gamma
        vim.g.neovide_text_gamma = 0.10
        vim.g.neovide_text_contrast = 0.8
        -- set scaling factor
        vim.g.neovide_scale_factor = 0.95
        -- set style like background and etc
        local alpha = function()
            return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
        end
        vim.g.transparency = 0.95
        vim.g.neovide_transparency = 0.95
        vim.g.neovide_underline_stroke_scale = 1.0
        -- set neovide refresh rate
        vim.g.neovide_refresh_rate = 144
        vim.g.neovide_refresh_rate_idle = 1
        -- set cursor
        vim.g.neovide_cursor_unfocused_outline_width = 0.5
        vim.g.neovide_cursor_trail_size = 0.845
        vim.g.neovide_cursor_antialiasing = true
        -- animate
        vim.g.neovide_cursor_animate_in_insert_mode = true
        vim.g.neovide_cursor_smooth_blink = true
        vim.g.noevide_cursor_vfx_mode = "ripple"
    end

    -- NOTE: this is configuration for better comments
    local bc = require 'better-comment'
    bc.Setup {
        -- TODO : set custom tags
        tags = {

            {
                name = "TODO",
                fg = "#282C34",  -- Background
                bg = "#E5C07B",  -- Light Yellow
                bold = true,
                virtual_text = "",
            },
            {
                name = "FIX",
                fg = "#282C34",  -- Background
                bg = "#E06C75",  -- Light Red
                bold = true,
                virtual_text = "",
            },
            {
                name = "BUG",
                fg = "#282C34",  -- Background
                bg = "#BE5046",  -- Darker Red
                bold = true,
                virtual_text = "",
            },
            {
                name = "NOTE",
                fg = "#282C34",  -- Background
                bg = "#98C379",  -- Light Green
                bold = true,
                virtual_text = "",
            },
            {
                name = "WARNING",
                fg = "#282C34",  -- Background
                bg = "#D19A66",  -- Orange
                bold = true,
                virtual_text = "",
            },
        }
    }
end
-- termguicolor
config.termguicolors = true

-- note
config.wiki = {
    path = "~/.note",
    extension = ".md",
}

-- shell
config.shell = 'fish'

-- fsync
config.fsync = true

-- nowrap
config.nowrap = true

-- kebind settings
-- map is regular neovim keymap bind
-- wmap is a whichkeymap
config.keybind = function(map, wmap)
    -- nerd Tree shortcut
    map('n', '<leader>nt', ':NvimTreeToggle<CR>', { silent = true, noremap = true })
    map('n', '<leader>nf', ':NvimTreeFocus<CR>', { silent = true, noremap = true })
    map('n', '<leader>nc', ':NvimTreeClose<CR>', { silent = true, noremap = true })
    map('n', '<leader>nr', ':NvimTreeRefresh<CR>', { silent = true, noremap = true })
    -- packer shortcuts
    map('n', '<leader>pi', ':PackerInstall<CR>', { silent = true, noremap = true })
    map('n', '<leader>pc', ':PackerClean<CR>', { silent = true, noremap = true })
    -- dashboard keymaps
    map('n', '<leader>d', ':Dashboard<CR>', { silent = true, noremap = true })
    map('n', '<leader>df', ':Telescope find_files<CR>', { silent = true, noremap = true })
    map('n', '<leader>dc', ':lua DashboardNvimConfig()<CR>', { silent = true, noremap = true })
    map('n', '<leader>dw', ':Telescope live_grep<CR>', { silent = true, noremap = true })
    map('n', '<leader>dl', ':lua LoadSession()<CR>', { silent = true, noremap = true })
    map('n', '<leader>dn', ':enew<CR>', { silent = true, noremap = true })
    map('n', '<C-c>', ':bd<CR>', { silent = true, noremap = true })
    -- telescope keybind
    map('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true, noremap = true })
    map('n', '<leader>fg', ':Telescope live_grep<CR>', { silent = true, noremap = true })
    map('n', '<leader>fb', ':Telescope buffers<CR>', { silent = true, noremap = true })
    map('n', '<leader>fh', ':Telescope hep_tags<CR>', { silent = true, noremap = true })
    -- save shortcuts
    map('n', '<leader>ss', ':w!<CR>', { silent = true, noremap = true })
    -- buffer move
    map('n', '<C-S-Right>', ':BufferLineMoveNext<CR>', { silent = true, noremap = true })
    map('n', '<C-S-Left>', ':BufferLineMovePrev<CR>', { silent = true, noremap = true })
    map('n', '<A-l>', ':bnext<CR>', { silent = true, noremap = true })
    map('n', '<A-h>', ':bprevious<CR>', { silent = true, noremap = true })
    -- minimap toggle
    map('n', '<leader>tm', ':MinimapToggle<CR>', { silent = true, noremap = true })
    -- Inrement/Decrement
    map('n', '<C-a>', ':-<CR>', { silent = true, noremap = true })
    map('n', '<C-x>', ':+<CR>', { silent = true, noremap = true })
    -- codeactions
    map('n', 'cf', ':Lspsaga finder<CR>', { silent = true, noremap = true })
    map('n', 'ca', ':Lspsaga code_action<CR>', { silent = true, noremap = true })
    map('n', 'cd', ':Lspsaga hover_doc<CR>', { silent = true, noremap = true })
    map('n', 'cs', ':Lspsaga show_line_diagnostics<CR>', { silent = true, noremap = true })
    map('n', 'cz', ':Lspsaga peek_definition<CR>', { silent = true, noremap = true })
    map('n', 'cg', ':Lspsaga goto_definition<CR>', { silent = true, noremap = true })
    map('n', '<leader>dr', ':Ranger<CR>', { silent = true, noremap = true })
    -- calendar
    map('n', '<leader>cal', ':Calendar<CR>', { silent = true, noremap = true })
    -- Trouble
    map('n', '<leader>tt', ':TroubleToggle<CR>', { silent = true, noremap = true })
    map('n', '<leader>tr', ':TroubleRefresh<CR>', { silent = true, noremap = true })
    map('n', '<leader>tc', ':TroubleClose<CR>', { silent = true, noremap = true })
    -- Github
    map('n', '<leader>gdd', ':Git add .<CR>', { silent = true, noremap = true })
    map('n', '<leader>gdc', ':Git commit<CR>', { silent = true, noremap = true })
    -- ToggleTerm
    map('n', '<leader>;', ':ToggleTerm <CR>', { silent = true, noremap = true })
    -- Tagbar
    map('n', '<leader>tb', ':TagbarToggle <CR>', { silent = true, noremap = true })

    -- set keybind for copy and paste on neovide
    if vim.g.neovide then
        map('i', '<C-S-V>', '"+p <CR>', { silent = true, noremap = true })
        map('i', '<C-S-C>', '"+y <CR>', { silent = true, noremap = true })
    end
end
