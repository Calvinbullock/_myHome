
---@diagnostic disable: undefined-global

-- =====================================================
--      		  [[ Auto Commands ]]
-- =====================================================

-- ===========================================
--  SAVE ON INSERT MODE EXIT
--      Basically auto save
-- ==========================================
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    callback = function()
        vim.cmd('w')
    end,
})

-- ===========================================
--  HIGHLIGHT ON YANK
--      See `:help vim.highlight.on_yank()`
-- ==========================================
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- ===========================================
--  ON SAVE
--      remove trailing white spaces on save
-- ==========================================
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function ()
        -- save cursor pos
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        vim.cmd([[%s/\s\+$//e]]) -- remove trailing white space
        -- restore the cursor pos
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

-- [[
-- Create highlight groups for comment patterns
vim.api.nvim_set_hl(0, 'TdoHint', { fg = "#0B0B0B", bg = "#89dceb" })
vim.api.nvim_set_hl(0, 'NoteHint', { fg = "#0B0B0B", bg = "#faa7e7" })
vim.api.nvim_set_hl(0, 'BugHint', { fg = "#0B0B0B", bg = "#B03060" })
vim.api.nvim_set_hl(0, 'WarnHint', { fg = "#0B0B0B", bg = "#E17862" })

-- ===========================================
--  HIGHLIGHT ON SAVE / BUFFER ENTER
--      highlight on buf-enter or buf-save
-- ==========================================
vim.api.nvim_create_autocmd({'BufEnter', 'BufWritePre'}, {
    callback = function()
        vim.fn.matchadd("TdoHint", "\\( TODO:\\)")
        vim.fn.matchadd("TdoHint", "\\(TODO:\\)")
        vim.fn.matchadd("NoteHint", "\\( NOTE:\\)")
        vim.fn.matchadd("BugHint", "\\( BUG:\\)")
        vim.fn.matchadd("WarnHint", "\\( WARN:\\)")
    end
})
-- ]]
