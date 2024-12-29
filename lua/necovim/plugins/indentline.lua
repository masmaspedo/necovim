local ibl = require'ibl'
local hooks = require 'ibl.hooks'

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

hooks.register(
    hooks.type.HIGHLIGHT_SETUP,
    function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F44747" })    -- Red
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#D7BA7D" }) -- Yellow
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#569CD6" })   -- Blue
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#CE9178" }) -- Orange
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#608B4E" })  -- Green
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C586C0" }) -- Violet/Purple
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#4EC9B0" })   -- Cyan
    end
)

vim.g.rainbow_delimiters = { highlight = highlight }
ibl.setup {
    exclude = {
        -- hide indent line on dashboard
        filetypes = { "dashboard" },
    },
    scope = {
        -- disabled scope
        enabled = true,
        highlight = highlight,
        show_exact_scope = false,
    },
    indent = {
        -- highlight = highlight,
    }
}
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

vim.opt.list = true
--vim.opt.listchars:append("space:.")
--vim.opt.listchars:append("eol:↴")

