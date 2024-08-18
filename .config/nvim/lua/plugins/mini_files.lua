return {
    'echasnovski/mini.files',
    version = '*',
    config = function ()
        require('mini.files').setup({
            mappings = {
                synchronize = "s",
                go_in_plus = "<CR>",
            },
            windows = {
                preview = true,
            },
        })
        vim.keymap.set('n', "<leader>fe", require('mini.files').open, {})
    end,
}

