---@diagnostic disable: undefined-global

return {
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup{

                current_line_blame = false,
                current_line_blame_formatter = '<author>, <author_time:%d-%m-%y> - <summary>',
                current_line_blame_opts = {
                    delay = 200,
                },

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
                    vim.keymap.set({'n', 'v'}, '[g', function()
                        if vim.wo.diff then return '[g' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
                    vim.keymap.set({'n', 'v'}, ']g', function()
                        if vim.wo.diff then return ']g' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
                end,
            }
            vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>',              { desc = '[G]itsigns Preview [H]unk'})
            vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk <CR>',               { desc = '[G]itsigns [S]tage Hunk'})
            vim.keymap.set('n', '<leader>gu', ':Gitsigns undo_stage_hunk<CR>',           { desc = '[G]itsigns [U]ndo Stage Hunk'})
            vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>',                { desc = '[G]itsigns [R]eset Hunk'})
            vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = '[G]itsigns Line [B]lame'})
            vim.keymap.set('n', '<leader>gD', ':Gitsigns diffthis<CR>',                  { desc = '[G]itsigns [D]iff This'})
        end,
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set('n', '<leader>gg', ':Git<CR> :resize 100%<CR>', { desc = '[G]it Status' })
            vim.keymap.set('n', '<leader>gc', ':Git commit -m "',          { desc = '[G]it [C]ommit cmd' })
            vim.keymap.set('n', '<leader>gC', ':Git commit<CR>',           { desc = '[G]it [C]ommit buffer' })
            vim.keymap.set('n', '<leader>gP', ':Git push<CR>',             { desc = '[G]it [P]ush<CR>' })
            vim.keymap.set('n', '<leader>gp', ':Git pull<CR>',             { desc = '[G]it [P]ull<CR>' })
            vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>',          { desc = '[G]it [D]iff Split'})
        end
    }}

