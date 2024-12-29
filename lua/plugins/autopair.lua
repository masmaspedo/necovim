local autopair = require 'nvim-autopairs'
autopair.setup {
    enable_check_bracket_line = true
}

-- If you want to automatically add `(` after selecting a function or method
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require('cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
