require 'bufferline'.setup {
    options = {
        mode = "buffers",
        numbers = "ordinal",
        offsets = { { filetype = "NERDTree", text = "File Explorer", highlight = "directory", text_align = "left" } },
        show_tab_indicator = true,
        -- diagnostics = "nvim_lsp",
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --    local icon = level:match("error") and "" or level:match("warning") and "" or ""
        --    return " (" .. icon .. " " .. count .. ")"
        -- end,
        separator_style = "slant",
        always_show_bufferline = true,
    }
}

