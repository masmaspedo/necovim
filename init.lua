-- Copyright (c) Bluespada 2024
-- Author	: bluespada <pentingmain@gmail.com>
-- License	: MIT
-- Version	: development-plus
-- Codename	: renew

local necovim = require 'necovim'

necovim.setup {
    -- set your plugins here
    plugins = {
    },
    bind = function(map)
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
        -- neogen
        map("n", "<leader>ng", ":lua require('neogen').generate()<CR>", { silent = true, noremap = true })
    end
}
