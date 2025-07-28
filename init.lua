-- Define the path where lazy.nvim will be installed (inside Neovim's standard data directory)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If lazy.nvim is not already installed at the defined path...
if not vim.loop.fs_stat(lazypath) then
  -- Clone the lazy.nvim repository from GitHub (stable branch) using git
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", -- speed up cloning by ignoring file history blobs
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- use the latest stable release
    lazypath,
  })
end

-- Prepend lazy.nvim to Neovim's runtime path so it loads early
vim.opt.rtp:prepend(lazypath)

-- Optional settings table (empty here, but you can pass config options)
local opts = {}

-- Load general Vim options/settings from a separate Lua module
require("vim-options")

-- Load and setup plugins using lazy.nvim by pointing it to the "plugins" directory/module
require("lazy").setup("plugins")

