
---@diagnostic disable: undefined-global

-- =====================================================
--      		  [[ Auto Commands ]]
-- =====================================================


-- Highlight on yank
--   See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- remove trailing white spaces on save
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
