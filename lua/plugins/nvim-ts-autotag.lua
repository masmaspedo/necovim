local autotag = require 'nvim-ts-autotag'
autotag.setup{
    opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true
    },
    per_filetype = {
        ["xml"] = {
            enable_close = true,
        },
        ["html"] = {
            enable_close = true,
        },
        ["htmlx"] = {
            enable_close = true,
        },
        ["jsx"] = {
            enable_close = true,
        },
        ["tsx"] = {
            enable_close = true,
        },
    },
}
