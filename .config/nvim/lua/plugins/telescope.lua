---@diagnostic disable: undefined-global

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    hidden = true,
                },
                current_buffer_fuzzy_find = {
                    theme = "dropdown",
                },
                live_grep = {
                    theme = "dropdown",
                },
                lsp_references = {
                    theme = "dropdown",
                },
            },
        })
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files,    { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string,   { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics,   { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep,     { desc = '[f]ind with [g]rep' })
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = 'fzf search current buffer' })
    end,
}
