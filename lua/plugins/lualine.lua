-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- Edited: Bluespada
local lualine = require 'lualine'

--local colors = {
  --black        = '#282828',
  --white        = '#ebdbb2',
  --red          = '#fb4934',
  --green        = '#b8bb26',
  --blue         = '#83a598',
  --yellow       = '#fe8019',
  --gray         = '#a89984',
  --darkgray     = '#3c3836',
  --lightgray    = '#504945',
  --inactivegray = '#7c6f64',
--}

local colors = {
  black        = '#282c34',  -- One Dark's primary background color
  white        = '#abb2bf',  -- Lighter text color
  red          = '#e06c75',  -- One Dark red
  green        = '#98c379',  -- One Dark green
  blue         = '#61afef',  -- One Dark blue
  yellow       = '#e5c07b',  -- One Dark yellow
  gray         = '#5c6370',  -- One Dark gray
  darkgray     = '#2c323c',  -- Darker background color
  lightgray    = '#3e4451',  -- Light gray text color
  inactivegray = '#4b5263',  -- Dimmed elements or inactive UI elements
}

local conditions = {
    buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = { left = "", right = "" },
        theme = 'onedark',
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {}
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
    }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function() return '▊' end,
    color = { fg = colors.green }, -- Sets highlighting of component
    left_padding = 0 -- We don't need space before this
}

ins_left {
    -- mode component
    function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.green,
            i = colors.red,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red
        }
        local mode_name = {
            n = 'NORMAL',
            i = 'INSERT',
            v = 'VISUAL',
            [''] = 'VISUAL',
            V = 'VISUAL',
            c = 'COMMAND',
            no = 'NO MODE',
            s = 'SELECT',
            S = 'SELECT',
            [''] = 'SELECT',
            ic = 'INSERT',
            R = 'REPLACE',
            Rv = 'REPLACE',
            cv = 'COMMAND',
            ce = 'COMMAND',
            r = 'REGION',
            rm = 'REGION',
            ['r?'] = 'REGION',
            ['!'] = 'EX',
            t = 'TERMINAL'
        }
        vim.api.nvim_command(
            'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()])
        return '󰄛 ' .. mode_name[vim.fn.mode()] .. " MODE"
        -- return '🐱 ' .. mode_name[vim.fn.mode()] .. " MODE"
    end,
    color = "LualineMode",
    left_padding = 0
}

ins_left {
    'branch',
    icon = '',
    condition = conditions.check_git_workspace,
    color = { fg = colors.violet, gui = 'bold' }
}

ins_left {
    'filename',
    condition = conditions.buffer_not_empty,
    color = { fg = colors.magenta }
}

ins_left {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = '  ', modified = '  ', removed = '  ' },
    color_added = colors.green,
    color_modified = colors.orange,
    color_removed = colors.red,
    condition = conditions.hide_in_width
}





-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left { function() return '%=' end }

ins_right {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' ',
    color = { fg = colors.fg }
}

ins_right {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    color_error = colors.red,
    color_warn = colors.yellow,
    color_info = colors.cyan
}

-- Add components to right sections
ins_right {
    'o:encoding', -- option component same as &encoding in viml
    upper = true, -- I'm not sure why it's upper case either ;)
    condition = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' }
}

ins_right {
    'fileformat',
    upper = true,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' }
}

ins_right {
    -- filesize component
    function()
        local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then return '' end
            local sufixes = { 'B', 'KB', 'MB', 'GB' }
            local i = 1
            while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format('%.1f%s', size, sufixes[i])
        end

        local file = vim.fn.expand('%:p')
        if string.len(file) == 0 then return '' end
        return format_file_size(file)
    end,
    condition = conditions.buffer_not_empty,
    -- icon = ''
    -- icon = '💾'
    icon = '󰆓'
}

-- ins_right { 'location', icon = '﫴' }
-- ins_right { 'location', icon = '📍' }

ins_right { 'location', icon = '' }

ins_right { 'progress', icon = '󱪖', color = { fg = colors.fg, gui = 'bold' } }


ins_right {
    function() return '▊' end,
    color = { fg = colors.green },
    right_padding = 0
}

-- Now don't forget to initialize lualine
lualine.setup(config)
