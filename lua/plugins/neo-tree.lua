return {
  -- Neo-tree plugin: a modern file explorer/tree sidebar for Neovim
  'nvim-neo-tree/neo-tree.nvim',
  
  -- Use the stable v3.x branch
  branch = 'v3.x',
  
  -- Plugin dependencies required by Neo-tree:
  dependencies = {
    'nvim-lua/plenary.nvim',          -- Utility functions used by many plugins
    'nvim-tree/nvim-web-devicons',   -- Optional: provides filetype icons in the tree
    'MunifTanjim/nui.nvim',           -- UI component library Neo-tree depends on
  },

  config = function()
    -- Map Ctrl+n to toggle the Neo-tree file explorer sidebar on and off
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
  end
}

--[[
What is Neo-tree?

Neo-tree is a powerful, extensible file explorer plugin for Neovim that displays your project’s files and directories in a sidebar. It supports features like:

- Icons (with nvim-web-devicons)
- Git integration
- Buffer and filesystem views
- Customizable UI components via nui.nvim

This config sets up Neo-tree on the stable v3.x branch and binds Ctrl+n to toggle the sidebar for easy access to your files while coding.
]]

