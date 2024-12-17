
return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    dependencies = {
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },
        keymap = { preset = 'default' },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        sources = {
            default = { 'lsp', 'snippets', 'luasnip', 'path', 'buffer' },
            -- optionally disable cmdline completions
            -- cmdline = {},
        },
        -- experimental signature help support
        -- signature = { enabled = true }
        autocomplete = { windows = { border = 'single', }, },
        documentation = {
            auto_show = true,
            windows = { border = 'double', },
        }
    },
    opts_extend = { "sources.default" }
}
