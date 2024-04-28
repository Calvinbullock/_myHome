return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin"

      -- transparency
      vim.cmd [[hi Normal guibg=NONE]]
      vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
      vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
      vim.g.highlight_Normal = { ctermbg='NONE', guibg='NONE'}
    end
  }
}
