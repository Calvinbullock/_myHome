
---@diagnostic disable: undefined-global

-- =====================================================
--      		  [[ Auto Commands ]]
-- =====================================================

-- autocmd groups
vim.api.nvim_create_augroup('BufWritePre',   { clear = true })
vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_augroup('autosave',      { clear = true })
vim.api.nvim_create_augroup('bufEnter',      { clear = true })

-- ===========================================
--  Wq = wq -- alias for save and quit
-- ==========================================
vim.api.nvim_create_autocmd("bufEnter", {
    pattern = '*',
    group = "bufEnter",
    callback = function()
        vim.api.nvim_buf_create_user_command(0, 'Wq', function()
            vim.cmd([[wq]])
        end, { desc = 'switch from ".h" to ".cpp" and back' })
    end,
})

-- ===========================================
--  C++ Header / Source File Toggle
-- ==========================================
vim.api.nvim_create_autocmd("Filetype", {
    pattern = { 'cpp', 'h'},
    group = "bufEnter",
    callback = function()
        vim.api.nvim_buf_create_user_command(0, 'HeaderToSource', function()
            local newFilePath = ""

            -- get current file path
            local currentBuf = vim.api.nvim_get_current_buf()
            local fileNamePath = vim.api.nvim_buf_get_name(currentBuf)

            -- get file extension
            local fileExtenstion = fileNamePath:match("%.([^%.]+)$")

            -- check and toggle header / source extension
            if fileExtenstion == "cpp" then
                newFilePath = fileNamePath:sub(1, -4)
                newFilePath = newFilePath .. "h"

            elseif fileExtenstion == "h" then
                newFilePath = fileNamePath:sub(1, -2)
                newFilePath = newFilePath .. "cpp"
            end

            -- Use only the file name not the file path for find?
            --local new_file_name = new_file_path:match("[^/]+$")

            vim.cmd("find" .. newFilePath)
        end, { desc = 'switch from ".h" to ".cpp" and back' })
    end,
})

-- ===========================================
--  AUTO SAVE
-- ==========================================
vim.api.nvim_create_autocmd({ 'BufLeave', 'CursorHold' }, {
    group = 'autosave',
    desc = 'auto-save',
    pattern = { '*', '-.lua'},
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

            -- -- CLEAR WHITE SPACE -- 900ms pause
            -- vim.defer_fn(function()
            --     local cursor_pos = vim.api.nvim_win_get_cursor(0) -- save cursor pos
            --     vim.cmd([[%s/\s\+$//e]])                   -- remove trailing white space
            --     vim.api.nvim_win_set_cursor(0, cursor_pos) -- restore the cursor pos
            -- end, 900)
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
--  clean white space -- ON SAVE
--      Remove trailing white spaces on save.
--      NOTE: dose not work with auto save
--          autocmd.
-- ==========================================
vim.api.nvim_create_autocmd('BufWritePre', {
    group = BufWritePre,
    pattern = '*',
    callback = function ()
        local cursor_pos = vim.api.nvim_win_get_cursor(0) -- save cursor pos
        vim.cmd([[%s/\s\+$//e]])                          -- remove trailing white space
        vim.api.nvim_win_set_cursor(0, cursor_pos)        -- restore the cursor pos
    end,
})

-- ===========================================
-- Create highlight groups for comment patterns
-- ===========================================
vim.api.nvim_set_hl(0, 'TdoHint', { fg = "#0B0B0B", bg = "#89dceb" })
vim.api.nvim_set_hl(0, 'NoteHint', { fg = "#faa7e7", bg = "none" })
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
