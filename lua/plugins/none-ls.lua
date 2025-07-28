return {
  -- null-ls plugin: integrates external formatters and linters into Neovim's LSP client
  "nvimtools/none-ls.nvim",

  config = function()
    -- Import null-ls module
    local null_ls = require("null-ls")

    -- Setup null-ls with formatting sources
    null_ls.setup({
      sources = {
        -- Use stylua to format Lua files
        null_ls.builtins.formatting.stylua,

        -- Use prettier to format web-related files (JS, JSON, CSS, etc.)
        null_ls.builtins.formatting.prettier,
      },
    })

    -- Map <leader>gf to format the current buffer using LSP formatting
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

--[[
What is null-ls?

null-ls is a plugin that allows you to hook external formatters, linters, and diagnostics tools into Neovim’s built-in LSP client, even if those tools don’t have a native language server.

In this setup:

- stylua is used to format Lua files
- prettier is used for web development files (JavaScript, CSS, JSON, etc.)
- A convenient keybinding <leader>gf is created to format the current file on demand

This way, you get a unified LSP experience with extra formatting and linting tools integrated seamlessly.
]]

