return { 
  -- Plugin repository for the Catppuccin colorscheme for Neovim
  "catppuccin/nvim", 

  -- Load this plugin immediately during startup (not lazy-loaded)
  lazy = false, 

  -- Assign a name to this plugin (used internally by lazy.nvim)
  name = "catppuccin", 

  -- Set high priority so this plugin loads before others (important for colorschemes)
  priority = 1000,

  -- Configuration function that runs after plugin loads
  config = function()
    -- Apply the Catppuccin colorscheme
    vim.cmd.colorscheme "catppuccin"
  end
}

