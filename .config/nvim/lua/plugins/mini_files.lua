return {
    'echasnovski/mini.files',
    version = '*',
    config = function ()
        require('mini.files').setup({
            windows = {
                preview = true,
            },
        })
        vim.keymap.set('n', "<leader>fe", require('mini.files').open, {})
    end,
}

