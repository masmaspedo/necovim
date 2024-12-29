local M = {}
local map = vim.api.nvim_set_keymap
local opt = vim.opt
local cmd = vim.api.nvim_command
local c = vim.cmd


M.init = function(packer, config)
    if not packer.bootstrap then
        if config.colorscheme then
            cmd("colorscheme "..config.colorscheme)
        else
            cmd("colorscheme catppuccin-mocha")
        end
    end
    -- default configuration
    opt.termguicolors = config.termguicolors and config.termguicolor or true
    opt.fsync = config.fsync and config.fsync or true
    opt.undofile = config.undofile and config.undofile or true
    opt.completeopt = config.completeopt and config.completeopt or 'menuone,noinsert,noselect'
    opt.smartcase = config.smartcase and config.smartcase or true
    opt.clipboard = config.clipboard and config.clipboard or 'unnamedplus'
    opt.tabstop = config.tabstop and config.tabstop or 4
    opt.softtabstop = config.softtabstop and config.softtabstop or 0
    opt.expandtab = config.expandtab and config.expandtab or true
    opt.shiftwidth = config.shiftwidth and config.shiftwidth or 4
    opt.ai = config.ai and config.ai or true
    opt.si = config.si and config.si or true
    opt.mouse = config.mouse and config.mouse or 'a'
    opt.showcmd = config.showcmd and config.showcmd or true
    opt.number = config.number and config.number or true
    opt.relativenumber = config.relativenumber and config.relativenumber or true
    opt.autoindent = config.autoindent and config.autoindent or true
    opt.background = config.background and config.background or 'dark'
    opt.shell = config.shell and config.shell or '/bin/sh'
    opt.title = config.title and config.title or false
    opt.encoding = config.encoding and config.encoding or 'utf-8'
    opt.cursorline = config.cursorline and config.cursorline or true
    opt.list = config.list and config.list or true
    opt.ignorecase = config.ignorecase and config.ignorecase or true
    opt.colorcolumn = config.colorcolumn and config.colorcolumn or '80'
    opt.splitbelow = config.splitbelow and config.splitbelow or true
    opt.splitright = config.splitright and config.splitright or true
    opt.scrolloff = config.scrolloff and config.scrolloff or 3
    opt.numberwidth = config.numberwidth and config.numberwidth or 4
    -- autocmd
    c([[
autocmd!
filetype on
filetype indent on
filetype plugin on
syntax on
set nowrap
set t_Co=256
set t_ut=
    ]])
end

return M
