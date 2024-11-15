---@diagnostic disable: undefined-global

-- =====================================================
--      			  [[ Keymaps ]]
-- =====================================================

-- leader key set
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>',      { desc = 'space is only leader key', silent = true })

-- j / k better behavior on wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- end / start of line keybinds
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = 'go to the beginning line' })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = 'go to the end of the line' })

-- next / prev buffers
vim.keymap.set("n", "[b", ":bnext<CR>", {desc = 'next buffer' })
vim.keymap.set("n", "]b", ":bprev<CR>", {desc = 'prev buffer' })
--vim.keymap.set("n", "<leader>a", "C-^", {desc = 'alt file' })

-- buffer manipulation
vim.keymap.set("n", "<leader>w", ":w<CR>",          {desc = 'save buffer'})
vim.keymap.set('n', '<leader>db', ':bdelete<CR>',   {desc = 'kill current buffer'})
vim.keymap.set('n', '<leader>=', 'gg=G<C-o>:w<CR>', {desc = 'formatting whole buffer'})
vim.keymap.set('n', '<leader>x', ':q<CR>',          {desc = 'quite with out save'})
--vim.keymap.set('n', 'ZZ', '<cmd>echo "Use :wq to save and quit"<CR>',                    {desc = 'disbale ZZ exit'})

-- misc
vim.api.nvim_set_keymap("n", "<leader>fx", ":Ex<CR>",             {desc = 'open netrw', noremap = true, silent = true})
vim.keymap.set('n', '<leader>nr', '<cmd>set relativenumber!<CR>', {desc = 'toggle relative line num'})
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'search-repace word (regex)'})

-- splits
vim.keymap.set('n', '<leader>b', '<cmd>split<return>',  {desc = 'horizontal split'})
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<return>', {desc = 'vertical split' })
-- NOTE: no keybinds yet
-- vim.keymap.set('n', '<leader>', '<cmd>vertical resize -2<return>',   { desc = 'decrease rows in the current window' })
-- vim.keymap.set('n', '<leader>', '<cmd>vertical resize +2<return>',   { desc = 'increase rows in the current window' })
-- vim.keymap.set('n', '<leader>', '<cmd>horizontal resize -2<return>', { desc = 'decrease columns in the current window' })
-- vim.keymap.set('n', '<leader>', '<cmd>horizontal resize +2<return>', { desc = 'increase columns in the current window' })

-- yank / paste
vim.keymap.set("x", "p", [["_dP]],             {desc = 'p pasts with out yanking'})
vim.keymap.set({"n", "v"}, "<leader>d", '"_d', {desc = 'dump to void on delete (no yank)'})

--  Use CTRL+<HJKL> to switch between windows
--    See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-H>', '<C-w><C-h>', { desc = 'Move focus to the left window'  })
vim.keymap.set('n', '<C-L>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-J>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-K>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- set "kj" to act like escape in insert mode
--vim.keymap.set("i", "jk", "<esc>")

-- NOTE  this is already implemented with options
--  sets "<leader>y" to interface with system clipboard
--vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>y", [["+Y]])

-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
