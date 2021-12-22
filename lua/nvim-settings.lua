local opt = vim.opt
-- undofiles
opt.undofile = true
opt.completeopt='menuone,noinsert,noselect'
-- configuration tab
opt.tabstop = 2
opt.softtabstop = 0
opt.expandtab = true
opt.shiftwidth = 2
opt.ai = true
opt.si = true
               
-- general configurations
opt.mouse = 'a'
opt.showcmd = true
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.background = 'dark'
opt.shell='fish'
opt.title = false
opt.encoding = 'utf-8'
opt.cursorline = true
opt.list = true
opt.foldmethod='syntax'

vim.cmd([[
autocmd!
filetype on
filetype indent on
filetype plugin on
syntax on
set nowrap
colorscheme onedark
]])
-- hi NonText guifg=bg

-- code folding
vim.cmd([[
augroup Autoview
autocmd!
autocmd BufWritePre,BufWinLeave ?* silent! mkview
autocmd BufWinEnter ?* silent! laodview
augroup END
]])

