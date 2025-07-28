-- Enable line numbers on the left side of the editor
vim.opt.number = true

-- Enable relative line numbers (lines show number relative to the current cursor line)
-- This helps with quickly seeing how far you need to move up/down
vim.opt.relativenumber = true

-- Use spaces instead of actual tab characters when pressing Tab
vim.cmd("set expandtab")

-- Set the width of a hard tabstop to 2 spaces (how many spaces a tab counts for)
vim.cmd("set tabstop=2")

-- Set the number of spaces a Tab feels like in insert mode (soft tabstop)
vim.cmd("set softtabstop=2")

-- Set the number of spaces used for indentation (when auto-indenting lines)
vim.cmd("set shiftwidth=2")

-- Set the "leader" key (prefix for custom shortcuts) to Spacebar for easier access
vim.g.mapleader = " "

