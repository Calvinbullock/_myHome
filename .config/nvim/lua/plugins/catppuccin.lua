---@diagnostic disable: undefined-global

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        -- 1. Setup the theme options
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
        })

        -- 2. Use a "Schedule" to apply the theme.
        -- This waits 1ms for Neovim to finish booting before applying colors.
        vim.schedule(function()
            vim.cmd.colorscheme "catppuccin"
            -- Apply your pink line numbers
            vim.api.nvim_set_hl(0, 'LineNr', { fg='#faa7e7', bold=false })
        end)
    end
}





-- return {
--     "catppuccin/nvim",
--     lazy = false,
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             background = {
--                 dark = "mocha",
--             },
--             transparent_background = true,
--             dim_inactive = {
--                 enabled = false,
--                 percentage = 0.0000000001,
--             },
--         })
--         vim.cmd.colorscheme "catppuccin"
--
--         -- Line numbers re-color
--         function LineNumberColors()
--             vim.api.nvim_set_hl(0, 'LineNr', { fg='#faa7e7', bold=false })
--         end
--         LineNumberColors()
--     end
-- }
