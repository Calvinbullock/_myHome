-- =====================================================
--      			  [[ Keymaps ]]     		      --
-- =====================================================

-- WARN  USE WITH CAUTION
vim.opt.exrc = false

-- NOTE  not sure what these do yet
--      Keymaps for better default experience
--      See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Disable ZZ exit behavior
vim.keymap.set('n', 'ZZ', '<cmd>echo "Use :wq to save and quit"<CR>')

-- jump to bash pass through
vim.keymap.set('n', '<leader>1', ':!')

-- c++ clang formating cmd
vim.keymap.set('n', '<leader>fo', ':w<CR><cmd>!clang-format -i %<CR>')

-- formatting whole buffer
vim.keymap.set('n', '<leader>fm', 'gg=G<C-o>:w<CR>')

-- kill current buffer
vim.keymap.set('n', '<leader>db', ':bdelete<CR>')

-- search the current word and replace with a new word in the entire file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Map file save keybind
vim.cmd[[nnoremap <leader>w :wa<cr>]]

-- sets " F" to open the netrw (default file view) in root directory.
vim.api.nvim_set_keymap("n", "<leader>f", ":Ex<CR>", {noremap = true, silent = true})

-- sets paste to paste over higlighted text with out overwritng the register
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

--  Use CTRL+<hjkl> to switch between windows
--    See `:help wincmd` for a list of all window commands
--    WARN  conflicts with auto complete bindings in nvim-cmp plugin
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- set "kj" to act like escape in insert mode
--vim.keymap.set("i", "jk", "<esc>")

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

-- =====================================================
--				[[ Setting options ]]				  --
-- =====================================================

-- Create highlight groups for comment patterns
vim.api.nvim_set_hl(0, 'TdoHint', { fg = "#0B0B0B", bg = "#89dceb" })
vim.api.nvim_set_hl(0, 'NoteHint', { fg = "#0B0B0B", bg = "#faa7e7" })
vim.api.nvim_set_hl(0, 'BugHint', { fg = "#0B0B0B", bg = "#B03060" })
vim.api.nvim_set_hl(0, 'WarnHint', { fg = "#0B0B0B", bg = "#E17862" })

-- set comment highlighting for following patterns
vim.fn.matchadd("TdoHint", "\\( TODO \\)")
vim.fn.matchadd("NoteHint", "\\( NOTE \\)")
vim.fn.matchadd("BugHint", "\\( BUG \\)")
vim.fn.matchadd("WarnHint", "\\( WARN \\)")

-- set the vim shell pass through to bash
vim.opt.shellcmdflag = '-ic'

-- set netrw to tree list by default.
vim.cmd("let g:netrw_liststyle = 3")

-- Spell check settings
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- See `:help vim.o`
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.autoindent = true
vim.opt.smartindent = true

-- support @ in filenames
vim.opt.isfname:append("@-@")

-- Set highlight on search
vim.o.hlsearch = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 50
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt.termguicolors = true

