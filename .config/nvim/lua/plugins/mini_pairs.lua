return {
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
}
