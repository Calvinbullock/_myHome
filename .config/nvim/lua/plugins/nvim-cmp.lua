---@diagnostic disable: undefined-global

return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',

        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',

        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
    },
    config = function ()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        -- luasnip setup
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}

        -- cmp setup
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            mapping = cmp.mapping.preset.insert {
                -- default complete scrolling is <c-n> & <c-p>
                ['<C-y>'] = cmp.mapping.confirm { select = true },

                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
            },
            formatting = {
                fields = { 'abbr', 'kind', 'menu' },
                format = function(entry, vim_item)
                    local maxwidth = 50
                    local ellipsis_char = '…'
                    if vim.fn.strchars(vim_item.abbr) > maxwidth then
                        vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, maxwidth) .. ellipsis_char
                    end
                    vim_item.menu = ({
                        nvim_lsp = 'LSP',
                        luasnip = 'Snip',
                        buffer = 'Buf',
                        path = 'Path',
                    })[entry.source.name]
                    return vim_item
                end,
            },
        }
    end
}
