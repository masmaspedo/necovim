local M = {}
local map = vim.api.nvim_set_keymap


function M.bind(c)
    if c.bind then
        c.bind(map)
    end
end


return M
