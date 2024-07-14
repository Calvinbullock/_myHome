return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({

            -- the 4 lines below are to stop it from yelling warings
            modules = { 'lspconfig' }, -- Example module
            sync_install = false,  -- Controls automatic installation (optional)
            ignore_install = {}, -- Empty list to ignore non

            ensure_installed = {
                'c',
                'cpp',
                'go',
                'lua',
                'python',
                'javascript',
                'typescript',
                'vimdoc',
                'vim'
            },

            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
