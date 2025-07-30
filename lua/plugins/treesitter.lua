return {
  -- Treesitter plugin: advanced syntax parser and highlighter for Neovim
  "nvim-treesitter/nvim-treesitter",

  -- Run :TSUpdate after installing to keep parsers up to date
  build = ':TSUpdate',

  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      -- Ensure these parsers are always installed
      ensure_installed = {"lua", "javascript", "c_sharp", "c" },

      -- Enable syntax highlighting based on Treesitter parsing
      highlight = { enable = true },
    })
  end
}

--[[
What is Treesitter?

Treesitter is a Neovim plugin that provides incremental parsing of source code for better syntax awareness. It enables advanced features like:

- Precise syntax highlighting
- Code folding based on syntax
- Better indentation and text objects

This setup automatically installs parsers for Lua, JavaScript, and C#, and enables syntax highlighting powered by Treesitter’s parsing engine.
]]

