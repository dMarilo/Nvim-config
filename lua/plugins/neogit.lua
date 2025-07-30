return {
  'TimUntersberger/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required dependency
  },
  config = function()
    require('neogit').setup({
      -- Optional configuration
      integrations = {
        diffview = true  -- If you want to use diffview.nvim for diffs
      }
    })
  end,
  keys = {
    { "<leader>gg", function() require("neogit").open() end, desc = "Open Neogit" },
    { "<leader>gl", ":Neogit log<CR>", desc = "Git Log" }
  },
  cmd = { "Neogit" },
}

