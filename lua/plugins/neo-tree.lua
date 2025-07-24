return {
  -- Inside your plugins table or separate plugin file
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
    'MunifTanjim/nui.nvim',
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
  end
}
