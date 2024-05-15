return  {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>g', ':G<CR>')
        vim.keymap.set('n', '<leader>gc', ':G commit -m "" ')
        vim.keymap.set('n', '<leader>gp', ':G push<CR>')
    end
}
