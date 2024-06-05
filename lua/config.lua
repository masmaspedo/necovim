local config = require 'necovim.config'
-- plugins
config.plugins = {
    { 'junegunn/seoul256.vim' },
    { "ellisonleao/gruvbox.nvim" },
    { "ayu-theme/ayu-vim" },
    { "tiagovla/tokyodark.nvim" },
    { "bluespada/justblack.vim" },
    -- { "wakatime/vim-wakatime" },
}
-- colorscheme
config.colorscheme = 'tokyodark'

config.init = function()
    -- custom configuration here
    require'tokyodark'.setup{
        transparent_background = false, -- set background to transparent
        gamma = 1.00, -- adjust the brightness of the theme
        styles = {
            comments = { italic = true }, -- style for comments
            keywords = { italic = true }, -- style for keywords
            identifiers = { italic = true }, -- style for identifiers
            functions = {}, -- style for functions
            variables = {}, -- style for variables
        },
        custom_highlights = {} or function(highlights, palette) return {} end, -- extend highlights
        custom_palette = {} or function(palette) return {} end, -- extend palette
        terminal_colors = true, -- enable terminal colors
    }
    -- vim.g.gruvbox_italic = true
    -- vim.g.gruvbox_transparent_bg = false
    -- vim.g.gruvbox_contrast_dark = "medium"
    -- vim.g.ayu = "mirage"
    -- vim.cmd([[autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE]])
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
    -- nerd Tree shortcuts
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
end
