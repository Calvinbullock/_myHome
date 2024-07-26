vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true

-- c++ clang formatting cmd
vim.keymap.set('n', '<leader>fm', ':w<CR><cmd>!clang-format -i %<CR>')

