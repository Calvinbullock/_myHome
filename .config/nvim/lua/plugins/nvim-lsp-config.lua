---@diagnostic disable: undefined-global

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'williamboman/mason.nvim', config = true  },
        { 'williamboman/mason-lspconfig.nvim'       },
    },
    config = function ()
        -- code actions keymap
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,         { desc = '[R]e[n]ame' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,    { desc = '[C]ode [A]ction' })
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { desc = 'Type [D]efinition' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition,             { desc = '[G]oto [D]efinition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,            { desc = '[G]oto [D]eclaration' })
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<cr>', { desc = 'Hover Documentation' })

        -- telescope functions keymap
        vim.keymap.set('n', 'gr', vim.lsp.buf.references,                                             { desc = '[g]oto [r]eferences (jumplist)' })
        vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references,                { desc = '[g]oto [r]eferences (fzf)' })
        vim.keymap.set('n', 'gI', require('telescope.builtin').lsp_implementations,                   { desc = '[G]oto [I]mplementation' })
        vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols,          { desc = '[D]ocument [S]ymbols' })
        vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

        -- Diagnostic keymaps
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev,          { desc = 'Go to previous diagnostic message' })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next,          { desc = 'Go to next diagnostic message' })
        vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
        vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

        -- [[ Configure LSP ]]
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local servers = {
            ---- other
            gopls = {},
            clangd = {'cpp', 'h'},
            bashls = {},
            -- rust_analyzer = {},

            ---- Web
            cssls = {},
            ts_ls = {},
            html = {},
            emmet_ls = {
                filetypes = {
                    "css",
                    "eruby",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "less",
                    "sass",
                    "scss",
                    "svelte",
                    "pug",
                    "typescriptreact",
                    "vue"
                },
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            },
            -- tsserver = {}, -- Keep using ts_ls from Mason.

            ---- python
            jedi_language_server = {},
            -- pyright = {},

            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        -- Add snippet support to capabilities for emmet_ls
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        -- Ensure the servers above are installed
        local mason_lspconfig = require 'mason-lspconfig'

        -- set up the lsp conf
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }
        mason_lspconfig.setup({
            -- This is the new way to provide a default setup function for lspconfig.
            -- It will be called for all servers that mason-lspconfig manages.
            lspconfig_setup = function(server_name)
                local server_config = servers[server_name] or {} -- Get the specific server config

                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    -- Merge the server-specific settings and filetypes
                    settings = server_config.settings,
                    filetypes = server_config.filetypes,
                    init_options = server_config.init_options,
                }
            end
        })

    end
}
