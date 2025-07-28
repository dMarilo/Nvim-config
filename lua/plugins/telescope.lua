return {
  {
    -- Main Telescope plugin (fuzzy finder for Neovim)
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',  -- Use a specific stable version
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Required utility library for Telescope

    config = function()
      -- Load built-in Telescope pickers
      local builtin = require("telescope.builtin")

      -- Map Ctrl+p to open file finder (find_files)
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})

      -- Map leader+fg to live grep search (search text in files)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },

  {
    -- Telescope extension to use Neovim's built-in UI select interface
    "nvim-telescope/telescope-ui-select.nvim",

    config = function()
      -- Setup Telescope to use the ui-select extension with a dropdown theme
      require("telescope").setup ({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- You can customize dropdown options here if needed
            }
          }
        }
      })
      -- Load the ui-select extension so it’s available to Telescope
      require("telescope").load_extension("ui-select")
    end
  },
}

--[[
What is Telescope?

Telescope is a powerful fuzzy finder plugin for Neovim that lets you quickly find files, search text, browse buffers, and much more — all with a nice, searchable UI.

This config:

- Installs Telescope pinned to version 0.1.5 with its dependency plenary.nvim
- Sets up handy keybindings for file search (Ctrl+p) and live grep (<leader>fg)
- Adds and configures the ui-select extension so built-in Neovim UI pickers can use Telescope’s dropdown menus for a smoother experience
]]

