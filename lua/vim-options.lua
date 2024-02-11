
vim.g.mapleader = " "

-- Transparent Background ??
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Sync clipboard between OS and Neovim.
--    Remove this option if you want your OS clipboard to remain independent.
--    See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

vim.opt.nu = true
vim.opt.relativenumber = true

-- Make line numbers default
--* vim.wo.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.updatetime = 50
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Set highlight on search
vim.o.hlsearch = false

vim.opt.termguicolors = true
vim.opt.colorcolumn = "80"
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

--[ SEARCHING FOLDERS
-- This can:
--    Hit tab to :find by partial match
--    Use * to make it fuzzy
--    THINGS TO CONSIDER:
--    :b lets you autocomplete any open buffer

-- Search down into sub folders
--    provide tab completion for all file related tasks
vim.opt.path:append('**')

-- Display all matching files when tab complete is used
vim.opt.wildmenu = true

-- map :find and :b commands
vim.api.nvim_set_keymap("n", "<Space>b", ":b ", {
	noremap = true, silent = true
})
vim.api.nvim_set_keymap("n", "<Space>f", ":find ", {
	noremap = true, silent = true
})
-- End Folder search]

-- ===================================================== --
--					 [[ Basic Keymaps ]]				 --
-- ===================================================== --

-- sets "(leader) p" to paste over a higlighted text with out 
--      overwitng the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- sets "F" to open the vim fileNav in current directory
vim.api.nvim_set_keymap("n", "<Space>F", ":Ex<CR>", {
	noremap = true, silent = true
})

-- sets "(leader) y" to interface with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+Y]])

-- ---------------- Not My Key Maps -------------------- --
--				AKA not sure what they do				 --

-- Keymaps for better default experience
--    See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
--    See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- Navigate vim panes better
--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
--vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
