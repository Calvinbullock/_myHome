return {
    'echasnovski/mini.files',
    version = '*',
    config = function ()
        require('mini.files').setup({
            mappings = {
                synchronize = "s",   -- default '='
                go_in_plus = "<CR>", -- default 'L'
            },
            windows = {
                preview = true,
                width_preview = 50,
            },
        })
        vim.keymap.set('n', "<leader>fe", require('mini.files').open, {})
    end,
}

