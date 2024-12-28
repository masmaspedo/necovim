local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- global setup nvim_lsp
local nvim_lsp = require 'lspconfig'

-- create a function to multiple number

-- disable copilot if detected
if vim.api.nvim_eval("exists('g:necovim_disable_copilot')") == 1 then
    if vim.api.nvim_eval("g:necovim_disable_lsp_copilot") == 1 then
        -- vim.cmd(":Codeium Disable")
    end
    -- vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#FF0000" })
end

-- create a some function to do + math

-- lspkind
local lspkind = require 'lspkind'
lspkind.init {}

-- setup cmp with config lspkind is a default formatting and its auto completion
local luasnip = require("luasnip")
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require 'cmp'
local cmp_higlight = require 'cmp.utils.highlight'
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

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    }
})

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

require 'lspsaga'.setup({
    ui = {
        -- beacon eanble
        -- currently only round theme
        theme = 'round',
        -- this option only work in neovim 0.9
        title = true,
        devicon = true,
        lines = { '┗', '┣', '┃', '━', '┏' },
        -- border type can be single,double,rounded,solid,shadow.
        border = 'rounded',
        winblend = 0,
        expand = '',
        collapse = '  ',
        preview = ' ',
        code_action = '',
        actionfix = '󱢇 ',
        code_action_prompt = { enable = false },
        -- code_action = '💡',
        diagnostic = '  ',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal background color
            normal_bg = '#282828',
            black = '#1c1c19',
        },
        breadcrumbs = {
            enable = false,
        },
        beacon = {
            enable = true,
            frequency = 7
        },
    }
})

local lsp_cmp = require 'cmp_nvim_lsp'

nvim_lsp.vimls.setup {
    capabilities = lsp_cmp.default_capabilities(),
}

require'mason'.setup {

}
local lspconfig = require'mason-lspconfig'
lspconfig.setup {
    ensure_installed = { 'lua_ls', 'ts_ls', 'pylsp', 'cssls', 'diagnosticls' },
    automatic_installation = false
}

-- automatic setup
lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        if server_name == 'pylsp' then
            require('lspconfig')[server_name].setup{
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
            require('lspconfig')[server_name].setup {}
        end
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
}

-- configuration for dart
local df_tools = require 'flutter-tools'
df_tools.setup {}

-- Lsp Trouble
local trouble = require 'trouble'
trouble.setup {}
