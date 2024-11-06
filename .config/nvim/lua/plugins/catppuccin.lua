---@diagnostic disable: undefined-global

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            background = {
                dark = "mocha",
            },
            transparent_background = true,
            dim_inactive = {
                enabled = false,
                percentage = 0.0000000001,
            },
        })
        vim.cmd.colorscheme "catppuccin"

        -- Line numbers re-color
        function LineNumberColors()
            vim.api.nvim_set_hl(0, 'LineNr', { fg='#faa7e7', bold=false })
        end
        LineNumberColors()
    end
}
