local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- some people think i am a stupid persons

-- global setup nvim_lsp
local nvim_lsp = require 'lspconfig'

-- disable copilot if detected
if vim.api.nvim_eval("exists('g:necovim_disable_copilot')") == 1 then
    if vim.api.nvim_eval("g:necovim_disable_lsp_copilot") == 1 then
        vim.cmd(":Codeium Disable")
    end
end

local on_attach = function(client, bufnr)
    if vim.api.nvim_eval("exists('g:necovim_disable_lsp_autoformat')") == 1 then
        if vim.api.nvim_eval("g:necovim_disable_lsp_autoformat") == 1 then
            return
        end
    else
        local format = require 'lsp-format'
        format.setup {
            typescript = { tab_width = 4 },
            yaml = { tab_width = 2 },
            dart = { tab_width = 2 },
            go = { tab_width = 4 },
        }
        format.on_attach(client)
    end
end
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
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    nvim_lua = "[Lua]",
                    latex_symbols = "[Latex]",
                }),
                maxwidth = 64,
                maxheight = 10,
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    })[entry.source.name]
                    return vim_item
                end
            })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = false })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"
            return kind
        end,
    },
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'nvim_lsp_signature_help' },
        },
        {
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
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    },
    view = {
        entries = { name = 'wildmenu', separator = '|' }
    }
})

cmp.setup.cmdline(':', {
    completion = { autocomplete = false },
    sources = cmp.config.sources({ { name = 'path' }, { name = 'cmdline' } }),
    view = {
        entries = { name = 'native', separator = '|' }
    }
})

local resolved = nil
local function get_kind(colors)
    if resolved then
        return resolved
    end
    local kind = {
        [1] = { 'File', ' ', colors.white },
        [2] = { 'Module', ' ', colors.blue },
        [3] = { 'Namespace', ' ', colors.orange },
        [4] = { 'Package', ' ', colors.purple },
        [5] = { 'Class', ' ', colors.purple },
        [6] = { 'Method', ' ', colors.purple },
        [7] = { 'Property', ' ', colors.cyan },
        [8] = { 'Field', ' ', colors.yellow },
        [9] = { 'Constructor', ' ', colors.blue },
        [10] = { 'Enum', '了', colors.green },
        [11] = { 'Interface', ' ', colors.orange },
        [12] = { 'Function', ' ', colors.purple },
        [13] = { 'Variable', ' ', colors.blue },
        [14] = { 'Constant', ' ', colors.cyan },
        [15] = { 'String', ' ', colors.green },
        [16] = { 'Number', ' ', colors.green },
        [17] = { 'Boolean', ' ', colors.orange },
        [18] = { 'Array', ' ', colors.blue },
        [19] = { 'Object', ' ', colors.orange },
        [20] = { 'Key', ' ', colors.red },
        [21] = { 'Null', ' ', colors.red },
        [22] = { 'EnumMember', ' ', colors.green },
        [23] = { 'Struct', ' ', colors.purple },
        [24] = { 'Event', ' ', colors.purple },
        [25] = { 'Operator', ' ', colors.green },
        [26] = { 'TypeParameter', ' ', colors.green },
        -- ccls
        [252] = { 'TypeAlias', ' ', colors.green },
        [253] = { 'Parameter', ' ', colors.blue },
        [254] = { 'StaticMethod', 'ﴂ ', colors.orange },
        [255] = { 'Macro', ' ', colors.red },
        -- for completion sb microsoft!!!
        [300] = { 'Text', ' ', colors.green },
        [301] = { 'Snippet', ' ', colors.blue },
        [302] = { 'Folder', ' ', colors.yellow },
        [303] = { 'Unit', ' ', colors.cyan },
        [304] = { 'Value', ' ', colors.blue },
    }

    if not vim.tbl_isempty(ui.kind) then
        local function find_index_by_type(k)
            for index, opts in pairs(kind) do
                if opts[1] == k then
                    return index
                end
            end
            return nil
        end

        for k, v in pairs(ui.kind) do
            local index = find_index_by_type(k)
            if not index then
                vim.notify('[lspsaga.nvim] not found kind in default')
                return
            end
            if type(v) == 'table' then
                kind[index][2], kind[index][3] = unpack(v)
            elseif type(v) == 'string' then
                kind[index][2] = v
            else
                vim.notify('[Lspsaga.nvim] value must be string or table')
            end
        end
    end

    resolved = function()
        return kind
    end

    return resolved
end

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
        code_action = ' ',
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

}

-- automatic setup
lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
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
