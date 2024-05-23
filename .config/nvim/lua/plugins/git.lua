return {
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup{
                -- See `:help gitsigns.txt`
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
                on_attach = function(bufnr)
                    -- don't override the built-in and fugitive keymaps
                    local gs = package.loaded.gitsigns
                    vim.keymap.set({'n', 'v'}, ']g', function()
                        if vim.wo.diff then return ']g' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
                    vim.keymap.set({'n', 'v'}, '[g', function()
                        if vim.wo.diff then return '[g' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
                end,
            }
            vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', {})
            vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', {})
            vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk <CR>', {})
            vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>', {})
        end,
    },
    {
        -- wrapper for 
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gg', ':Git<CR>')
            vim.keymap.set('n', '<leader>gc', ':Git commit -m "')
            vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
        end
    }
}

