return {
    {
        'echasnovski/mini.pairs',
        version = '*',
        config = function ()
            require('mini.pairs').setup({
                mappings = {
                    ['"'] = { action = 'open', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
                    ["'"] = { action = 'open', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
                    ['`'] = { action = 'open', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
                },
            })
        end,
    },
    {
        'echasnovski/mini.trailspace',
        version = '*',
        config = function ()
            require('mini.trailspace').setup({})
        end,
    },
    {
        'echasnovski/mini.indentscope',
        version = '*',
        config = function ()
            require('mini.indentscope').setup({
                draw = {
                    delay = 10,
                }
            })
        end,
    },
}
