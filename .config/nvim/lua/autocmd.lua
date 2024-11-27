
---@diagnostic disable: undefined-global

-- =====================================================
--      		  [[ Auto Commands ]]
-- =====================================================

-- autocmd groups
vim.api.nvim_create_augroup('BufWritePre', { clear = true })
vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_augroup('autosave', { clear = true })

-- ===========================================
--  AUTO SAVE
-- ==========================================
vim.api.nvim_create_autocmd({ 'BufLeave', 'CursorHold' }, {
    group = autosave,
    desc = 'auto-save',
    pattern = '*',
    callback = function(ctx)
        if
            vim.bo[ctx.buf].modified
            and vim.bo[ctx.buf].modifiable
            and vim.bo[ctx.buf].buftype == '' -- normal buffer
            and vim.api.nvim_buf_get_name(ctx.buf) ~= '' -- buffer is named
            and vim.uv.fs_stat(vim.api.nvim_buf_get_name(ctx.buf)) -- buffer has an existing file backing it
        then
            vim.cmd.update()
            vim.defer_fn(function() vim.api.nvim_echo({ { '' } }, false, {}) end, 2000)
        end
    end,
})

-- ===========================================
--  HIGHLIGHT ON YANK
--      See `:help vim.highlight.on_yank()`
-- ==========================================
vim.api.nvim_create_autocmd('TextYankPost', {
    group = YankHighlight,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- ===========================================
--  ON SAVE
--      remove trailing white spaces on save
-- ==========================================
vim.api.nvim_create_autocmd('BufWritePre', {
    group = BufWritePre,
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
    group = BufWritePre,
    pattern = '*',
    callback = function()
        vim.fn.matchadd("TdoHint", "\\( TODO:\\)")
        vim.fn.matchadd("TdoHint", "\\(TODO:\\)")
        vim.fn.matchadd("NoteHint", "\\( NOTE:\\)")
        vim.fn.matchadd("BugHint", "\\( BUG:\\)")
        vim.fn.matchadd("WarnHint", "\\( WARN:\\)")
    end
})
-- ]]
