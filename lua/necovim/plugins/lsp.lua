-- initialize lspkind
local lspkind = require'lspkind'
lspkind.init{}

-- fidget lsp indicator
local fidget = require'fidget'
fidget.setup {
    debug = {
        logging = true,
        strict = true,
    }
}


-- setup ai codeium
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

-- setup cmp and snippet
local luasnip = require'luasnip'
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- setup cmp
local cmp = require'cmp'
local cmp_highlight = require'cmp.utils.highlight'
cmp.setup {
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatingBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jumpable()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's', 'c'}),
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jumpable()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's', 'c'}),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jumpable()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's', 'c'}),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymouse"](args.body)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            local kind = lspkind.cmp_format({
                with_text = true,
                mode = "symbol_text",
                menu = ({
                    codeium = "[Codeium]",
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                }),
                maxwidth = 50,
                maxheight = 10,
                before = function(entry, vim_item)
                    if entry.source.name == 'codeium' then
                        vim_item.kind = string.format('%s %s', "󱚝", "AI")
                    end
                    vim_item.menu = ({
                        codeium = "[Codeium]",
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    })[entry.source.name]
                    return vim_item
                end
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    [" .. (strings[2] or "") .. "]"
            return kind
        end,
    },
    sources = cmp.config.sources(
        {
            { name = 'codeium' },
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'nvim_lsp_signature_help' },
            {
                name = 'buffer',
                option = {
                    get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
                }
            },
            { name = 'look', keyword_length = 2, option = { convert_case = true, loud = false } }
        }
    ),
    view = {
        -- entries = 'native'
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    experimental = {
        ghost_text = true
    }
}

-- setup cmdline
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    }),
    view = {
        -- entries = { name = 'native', separator = '|' }
        entries = { name = 'custom', selection_order = 'near_cursor' }
    }
})
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    }
})

-- setup lspsaga
local lspsaga = require'lspsaga'
lspsaga.setup {
    code_action = {
        show_server_name = true,
        show_gitsign = true
    },
    diagnostic = {
    },
    ui = {
        -- beacon enable
        -- currently only round theme
        theme = 'round',
        -- this option only work in neovim 0.9
        title = true,
        devicon = false,
        lines = { '┗', '┣', '┃', '━', '┏' },
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
        expand = '',
        collapse = '  ',
        preview = ' ',
        -- code_action = '',
        code_action = '',
        actionfix = '󱢇 ',
        code_action_prompt = { enable = true },
        -- code_action = '💡',
        diagnostic = '  ',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal background color
            normal_bg = '#282828',
            black = '#1c1c19',
        },
        beacon = {
            enable = true,
            frequency = 7
        },
    },
    symbol_in_winbar = {
        enable = true,
        separator = ' 󰄾 '
    },
    implementation = {
        enable = true
    }
}

-- lsp setup
local nvim_lspconfig = require'lspconfig'
vim.diagnostic.config {
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x'
    }
}
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for name, icon in pairs(symbols) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

local cmp_lsp = require'cmp_nvim_lsp'
-- setup snippet support
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lspconfig.vimls.setup {
    capabilities = cmp_lsp.default_capabilities()
}

local mason = require'mason'
mason.setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

local mason_lsp_config = require'mason-lspconfig'
mason_lsp_config.setup{
    ensure_installed = { 'lua_ls' },
    automatic_installation = true,
}

-- auto setup
mason_lsp_config.setup_handlers {
    function (server_name) -- default handler (optional)
        if server_name == 'pylsp' then
            require('lspconfig')[server_name].setup{
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = {'W391', 'E501', 'E302', 'W293'},
                                maxLineLength = 100
                            }
                        }
                    }
                }
            }
        else
            require('lspconfig')[server_name].setup {
                capabilities = capabilities,
            }
        end
    end,
}

-- trouble
local trouble = require'trouble'
trouble.setup{
    icons = {
        ---@type trouble.Indent.symbols
        indent = {
            top           = "│ ",
            middle        = "├╴",
            last          = "└╴",
            -- last          = "-╴",
            -- last       = "╰╴", -- rounded
            fold_open     = " ",
            fold_closed   = " ",
            ws            = "  ",
        },
        folder_closed   = " ",
        folder_open     = " ",
        kinds = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TypeParameter = " ",
            Variable      = "󰀫 ",
        },
    }
}
