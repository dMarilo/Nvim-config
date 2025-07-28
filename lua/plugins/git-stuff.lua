return {
  {
    -- vim-fugitive: a Git wrapper for Vim/Neovim, adds powerful Git commands inside the editor
    "tpope/vim-fugitive"
  },
  {
    -- gitsigns.nvim: shows Git changes (adds, deletes, modifications) in the sign column
    "lewis6991/gitsigns.nvim",

    config = function()
      -- Setup gitsigns with default configuration
      require("gitsigns").setup()

      -- Map <leader>gp to preview the current Git hunk (changes block)
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})

      -- Map <leader>gt to toggle showing the current line blame (who last changed the line)
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  }
}

--[[
What is this Git integration setup?

This configuration includes:

- vim-fugitive: a comprehensive Git plugin that integrates Git commands directly inside Neovim for efficient version control.
- gitsigns.nvim: visually shows Git changes next to the line numbers and provides handy commands such as previewing changes in the current hunk and toggling inline blame annotations.

Keybindings <leader>gp and <leader>gt make it easy to inspect Git changes without leaving the editor.
]]

