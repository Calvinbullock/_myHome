
-- ==================================================== --
--              			 TODO List			                  -- 
-- ==================================================== --

-- TODO need to better understand this config / add better guide comments 

-- line 48 might be redundent - leader key maping

-- set a keybind to turn spell check on and off
-- Brake init.lua up into smaller files, exstentions each in there own.

-- Set macros for indentation, full doc formating, line commenting

-- ==================================================== --
--
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
