return {
  {
    -- mason.nvim: a package manager for LSP servers, linters, and formatters
    "williamboman/mason.nvim",
    lazy = false,  -- Load immediately on startup
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- mason-lspconfig bridges mason.nvim with nvim-lspconfig for easier LSP server installation
    "williamboman/mason-lspconfig.nvim",
    lazy = false,  -- Load immediately on startup
    config = function()
      require("mason-lspconfig").setup({
        -- Automatically ensure these language servers are installed
        ensure_installed = { "lua_ls", "ts_ls" },
      })
    end,
  },

  {
    -- nvim-lspconfig: core Neovim plugin to configure language servers
    "neovim/nvim-lspconfig",

    config = function()
      -- Setup capabilities to integrate nvim-cmp completion with LSP servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")

      -- Configure Lua language server with enhanced capabilities
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

      -- Configure TypeScript language server with enhanced capabilities
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

      -- Key mappings for common LSP actions:
      -- "K": show hover information about symbol under cursor
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

      -- "gd": go to definition of symbol under cursor
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})

      -- "<leader>ca": show available code actions in normal and visual modes
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      -- Automatically show diagnostics popup when cursor is idle
      --
      vim.o.updatetime = 250

      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        callback = function()
          local opts = {
            -- get diagnostics on current line
            bufnr = 0,  -- current buffer
            lnum = vim.api.nvim_win_get_cursor(0)[1] - 1, -- 0-indexed current line
          }
          local diagnostics = vim.diagnostic.get(opts.bufnr, { lnum = opts.lnum })

          if diagnostics ~= nil and #diagnostics > 0 then
            -- only open float if diagnostics exist on this line
            vim.diagnostic.open_float(nil, { focusable = false })
          end
        end,
      })

    end,
  },
}

--[[
What is this LSP setup?

This configuration manages Language Server Protocol (LSP) integration with Neovim using:

- mason.nvim: a package manager that installs LSP servers and related tools automatically
- mason-lspconfig.nvim: bridges mason with nvim-lspconfig for easier LSP server management
- nvim-lspconfig: core plugin to configure and interact with language servers

It ensures the Lua and TypeScript language servers are installed and configures them to work with the nvim-cmp completion plugin.

Keybindings provide easy access to:

- Hover information ("K")
- Jumping to definitions ("gd")
- Running code actions ("<leader>ca")

This setup creates a smooth, integrated development experience with code intelligence features.
]]

