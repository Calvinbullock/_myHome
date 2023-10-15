
-- sets leader key to spacebar
vim.cmd([[let mapleader=" "]])

-- sets " f" to open the vim fileNav in current directory
vim.api.nvim_set_keymap("n", "<Space>f", ":Ex<CR>", {
    noremap = true, silent = true 
})

-- sets "(leader) p" to paste over a higlighted text with out 
--      overwitng the buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- sets "(leader) y" to interface with system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>y", [["+Y]])

