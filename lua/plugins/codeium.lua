local codeium = require 'codeium'
codeium.setup {
    enable_cmp_source = true,
    virtual_text = {
        enable = true,
        manual = false,
        idle_delay = 0,
        virtual_text_priority = 1,
    },
    workspace_root = {
        use_lsp = true
    }
}


