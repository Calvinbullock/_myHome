
-- =====================================================
--      			  [[ Keymaps ]]     		      
-- =====================================================

-- NOTE  not sure what these do yet
--      Keymaps for better default experience
--      See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- pass through to shell
vim.keymap.set('n', '<leader>1', ':!')

-- formatting whole buffer
vim.keymap.set('n', '<leader>fm', 'gg=G<C-o>:w<CR>')

-- kill current buffer
vim.keymap.set('n', '<leader>db', ':bdelete<CR>')

-- next / prev buffers
vim.keymap.set("n", "[b", ":bnext<CR>")
vim.keymap.set("n", "]b", ":bprev<CR>")

-- search the current word and replace with a new word in the entire file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- file save keybind
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Disable ZZ exit behavior
vim.keymap.set('n', 'ZZ', '<cmd>echo "Use :wq to save and quit"<CR>')

-- sets " F" to open the netrw (default file view) in root directory.
vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", {noremap = true, silent = true})

-- sets paste to paste over highlighted text with out over writing the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- <leader>d... will dump to the void instead of yanking to the register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- [[ Highlight on yank ]]
--   See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

--  Use CTRL+<HJKL> to switch between windows
--    See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-H>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-L>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-J>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-K>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- set "kj" to act like escape in insert mode
--vim.keymap.set("i", "jk", "<esc>")

-- NOTE  this is already implemented with options
-- sets "<leader>y" to interface with system clipboard
--vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>y", [["+Y]])

-- reload current nvim config
--vim.api.nvim_set_keymap("n", "<leader>s", ":source %<cr>", {noremap = true, silent = true})

-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
