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
                lualine_b = {'branch', 'diff', 'diagnostics', 'selectioncount'},
                lualine_c = {{'filename', file_status = true, path = 1}},
                -- lualine_x = {'encoding', 'fileformat'}, -- not that needed day to day
                lualine_x = {''},
                -- lualine_y = {''},
                -- lualine_z = {''},
            },
        })
    end,
}
