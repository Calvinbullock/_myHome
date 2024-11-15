return {
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = "catppuccin",
                component_separators = '',
                section_separators = '',
            },
            sections = {
                -- lualine_a = {'mode'},
                lualine_b = {'diff', 'diagnostics', 'selectioncount', {'filename', file_status = true, path = 1}},
                lualine_c = {''},
                lualine_x = {''}, -- {'encoding', 'fileformat'}
                lualine_y = {'branch', 'progress'},
                lualine_z = {'location'}
            },
        })
    end,
}
