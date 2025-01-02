require 'gitsigns'.setup {
    signs_staged_enable = true,
    signcolumn = true,
    word_diff = false,
    numhl = true,
    linehl = false,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = ' <author>, 󰔚 <author_time:%R> -  <summary>',
}
