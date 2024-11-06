---@diagnostic disable: undefined-global

-- =====================================================
--              [[ netrw functions ]]
-- src: https://www.reddit.com/r/neovim/comments/1dc78r4/custom_netrw_workflow_settings_maps_etc/
-- =====================================================

-- Function to toggle the netrw file browser
function ToggleNetRW()
    -- Check if the current filetype is netrw
    if vim.bo.filetype == 'netrw' then
        vim.api.nvim_command('bdel') -- Close buffer
    else
        -- Open the default explorer window using the Ex command
        vim.api.nvim_command('Ex')
    end
end

-- Create a command named ToggleNetRW that calls the ToggleNetRW function
vim.api.nvim_command('command! ToggleNetRW lua ToggleNetRW()')

-- Create an autocommand group named netrw
vim.api.nvim_create_augroup('netrw', { clear = true })

-- Autocommand triggered when filetype changes to netrw
vim.api.nvim_create_autocmd('FileType', {
    group = 'netrw',
    pattern = 'netrw',
    callback = function()

        -- Set buffer type to nofile (not a regular file)
        vim.api.nvim_command('setlocal buftype=nofile')
        -- Hide buffer when it loses focus
        vim.api.nvim_command('setlocal bufhidden=wipe')

        -- Key mappings in normal mode:
        --  - Toggle netrw with <C-C>
        vim.keymap.set('n', '<C-C>', '<CMD>ToggleNetRW<CR>', { noremap = true, silent = true, buffer = true })
        --  - Same as <C-C>
        vim.keymap.set('n', '<esc>', '<CMD>ToggleNetRW<CR>', { noremap = true, silent = true, buffer = true })
        --  - Open current directory in explorer with 'e'
        vim.keymap.set('n', 'e', '<CMD>Ex ~<CR>', { remap = true, silent = true, buffer = true })
        --  - Open current working directory in explorer with 'w'
        vim.keymap.set('n', 'w', '<CMD>Ex ' .. vim.fn.getcwd() .. '<CR>', { remap = true, silent = true, buffer = true })
        --  - Go to parent directory with backspace
        vim.keymap.set('n', '<BS>', '-', { remap = true, silent = true, buffer = true })
        --  - Refresh netrw with 'r'
        vim.keymap.set('n', 'r', 'R', { remap = true, silent = true, buffer = true })
    end
})
