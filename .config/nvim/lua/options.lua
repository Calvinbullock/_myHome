---@diagnostic disable: undefined-global

-- =====================================================
--				[[ Setting options ]]
-- =====================================================

-- WARN: USE WITH CAUTION
vim.opt.exrc = false

-- diagnostics conf
vim.diagnostic.config({
    virtual_text = {
        current_line = false,
    },
    virtual_lines = {
        current_line = true,
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
})

-- Spell check settings
vim.opt.spell = true
vim.opt.spelllang = 'en_us'
--vim.opt.spelloptions = 'camel'

-- line nums
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- line wrap / break
vim.opt.wrap = false
vim.opt.linebreak = true
--vim.opt.textwidth = 80

-- Other
vim.opt.scrolloff = 15
--vim.opt.cmdheight = 0                   -- cmd line only shows when typing a cmd
vim.opt.swapfile = false                -- Disable swapfile
vim.opt.isfname:append("@-@")           -- support @ in filenames
vim.o.mouse = 'a'                       -- Enable mouse mode
vim.o.clipboard = 'unnamedplus'         -- Sync clipboard between OS and Neovim.
vim.o.undofile = true                   -- Save undo history
vim.o.completeopt = 'menuone,noselect'  -- Set completeopt to have a better completion experience
vim.o.winborder = "rounded"

-- indention
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.o.breakindent = true        -- sets wrap indent on to match line indention

-- fold settings -- zo (opens a fold) -- zc (close a fold)
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

-- highlight on search
vim.o.hlsearch = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

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

-- Colors
--      NOTE  You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt.termguicolors = true
