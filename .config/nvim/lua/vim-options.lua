-- =====================================================
--			[[ Keymaps ]]		      --
-- =====================================================

-- NOTE not sure what these do yet {
    -- Keymaps for better default experience
    -- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- }

-- Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Disable ZZ exit behavior
vim.keymap.set('n', 'ZZ', '<cmd>echo "Use :wq to save and quit"<CR>')

-- Spell check settings
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- Remap save 
vim.cmd[[nnoremap <leader>w :wa<cr>]]

-- set "kj" to act like escape in insert mode
--vim.keymap.set("i", "jk", "<esc>")

-- sets " F" to open the netrw (default file view) in root directory.
vim.api.nvim_set_keymap("n", "<Space>f", ":Ex<CR>", {
	noremap = true, silent = true
})

-- set netrw to tree list by default.
vim.cmd("let g:netrw_liststyle = 3")

-- sets "(leader) p" to paste over a higlighted text with out 
    --  overwitng the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- sets "(leader) y" to interface with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+Y]])

-- [[ Highlight on yank ]]
    -- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})


-- =====================================================
--				[[ Setting options ]]				  --
-- =====================================================

-- set comment highlighting for following patterns
vim.fn.matchadd("DiagnosticSignInfo", "\\(TODO\\)")
vim.fn.matchadd("DiagnosticHint", "\\(NOTE\\)")
vim.fn.matchadd("DiagnosticFloatingError", "\\(BUG\\)")
vim.fn.matchadd("DiagnosticWarn", "\\(WARNING\\)")
vim.fn.matchadd("DiagnosticWarn", "\\(WARN\\)")

--[[
vim.fn.matchadd("DiagnosticWarn", "\\(HACK:\\)")
vim.fn.matchadd("Identifier", "\\(PERF:\\)")
vim.fn.matchadd("Identifier", "\\(PERFORMANCE:\\)")
vim.fn.matchadd("Identifier", "\\(OPTIM:\\)")
vim.fn.matchadd("Identifier", "\\(OPTIMIZE:\\)")
vim.fn.matchadd("Identifier", "\\(TEST:\\)")
vim.fn.matchadd("Identifier", "\\(TESTING:\\)")
vim.fn.matchadd("Identifier", "\\(PASSED:\\)")
vim.fn.matchadd("Identifier", "\\(FAILED:\\)")
]]

-- See `:help vim.o`

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.smartindent = true
vim.opt.isfname:append("@-@")


-- Set highlight on search
vim.o.hlsearch = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
	-- Remove this option if you want your OS clipboard to remain independent.
	-- See `:help 'clipboard'`
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

