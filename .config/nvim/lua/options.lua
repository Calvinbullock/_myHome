---@diagnostic disable: undefined-global

-- =====================================================
--				[[ Setting options ]]
-- =====================================================

-- WARN: USE WITH CAUTION
vim.opt.exrc = false

-- Create highlight groups for comment patterns
vim.api.nvim_set_hl(0, 'TdoHint', { fg = "#0B0B0B", bg = "#89dceb" })
vim.api.nvim_set_hl(0, 'NoteHint', { fg = "#0B0B0B", bg = "#faa7e7" })
vim.api.nvim_set_hl(0, 'BugHint', { fg = "#0B0B0B", bg = "#B03060" })
vim.api.nvim_set_hl(0, 'WarnHint', { fg = "#0B0B0B", bg = "#E17862" })

vim.fn.matchadd("TdoHint",  "\\( TODO:\\)")
vim.fn.matchadd("NoteHint", "\\( NOTE:\\)")
vim.fn.matchadd("BugHint",  "\\( BUG:\\)")
vim.fn.matchadd("WarnHint", "\\( WARN:\\)")

-- set the vim shell pass through to bash
vim.opt.shellcmdflag = '-ic'

-- Disable netrw banner and set list style to tree(3)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- netrw Disable highlighting, set read-only, etc.
vim.g.netrw_bufsettings = 'nonu nornu noma ro nobl'

-- Spell check settings
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
--vim.opt.spelloptions = 'camel'

-- line nums
vim.opt.nu = true
vim.opt.relativenumber = true

-- Other
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.linebreak = false
--vim.opt.textwidth = 80

vim.opt.scrolloff = 15
vim.opt.cmdheight = 0

vim.opt.autoindent = true
vim.opt.smartindent = true

-- fold settings -- zo (opens a fold) -- zc (close a fold)
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

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

-- NOTE  You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt.termguicolors = true
