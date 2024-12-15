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


    -- NOTE: custom configuration here
    local onedark = require 'onedark'
    onedark.setup({
        style = "dark"
    })
    onedark.load()
    
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
                fg = "#fbf1c7",
                bg = "#458588",
                bold = true,
                virtual_text = "",
            },
            {
                name = "FIX",
                fg = "#fbf1c7",
                bg = "#cc241d",
                bold = true,
                virtual_text = "",
            },
            {
                name = "BUG",
                fg = "#fbf1c7",
                bg = "#fb4934",
                bold = true,
                virtual_text = "",
            },
            {
                name = "NOTE",
                fg = "#fbf1c7",
                bg = "#689d62",
                bold = true,
                virtual_text = "",
            },
            {
                name = "WARNING",
                fg = "#fbf1c7",
                bg = "#d79921",
                bold = true,
                virtual_text = "",
            },
        }
    }

    -- NOTE: VIM CMP HIGHLIGHTS COLOR
    -- Custom highlights for nvim-cmp styled for One Dark Pro
    vim.api.nvim_set_hl(0, "Pmenu", { fg = "#ABB2BF", bg = "#282C34" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#FFFFFF", bg = "#3E4452" })
    
    -- Abbreviation and matching highlights
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#5C6370", bg = "NONE", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#61AFEF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#61AFEF", bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C678DD", bg = "NONE", italic = true })
    
    -- Field, Property, and Event
    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#E06C75", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#E06C75", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#E06C75", bg = "#3E4452" })
    
    -- Text, Enum, and Keyword
    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#98C379", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#98C379", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#98C379", bg = "#3E4452" })
    
    -- Constant, Constructor, and Reference
    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#E5C07B", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#E5C07B", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#E5C07B", bg = "#3E4452" })
    
    -- Function, Struct, Class, Module, and Operator
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C678DD", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#C678DD", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#C678DD", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#C678DD", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#C678DD", bg = "#3E4452" })
    
    -- Variable and File
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#E06C75", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#E06C75", bg = "#3E4452" })
    
    -- Unit, Snippet, and Folder
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D19A66", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#D19A66", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#D19A66", bg = "#3E4452" })
    
    -- Method, Value, and Enum Member
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#61AFEF", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#61AFEF", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#61AFEF", bg = "#3E4452" })
    
    -- Interface, Color, and Type Parameter
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#56B6C2", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#56B6C2", bg = "#3E4452" })
    vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#56B6C2", bg = "#3E4452" })

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
    map('n', 'cf', ':Lspsaga lsp_finder<CR>', { silent = true, noremap = true })
    map('n', 'ca', ':Lspsaga code_action<CR>', { silent = true, noremap = true })
    map('n', 'cd', ':Lspsaga hover_doc<CR>', { silent = true, noremap = true })
    map('n', 'cs', ':Lspsaga show_line_diagnostics<CR>', { silent = true, noremap = true })
    map('n', 'cz', ':Lspsaga preview_definition<CR>', { silent = true, noremap = true })
    map('n', 'cg', ':Lspsaga goto_definition<CR>', { silent = true, noremap = true })
    map('n', 'cj', ':Lspsaga jump_to_implementation<CR>', { silent = true, noremap = true })
    -- ranger
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
