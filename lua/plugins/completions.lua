return {
  {
    -- Source for nvim-cmp to provide completions from Neovim's built-in LSP client
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    -- LuaSnip: snippet engine for Neovim
    "L3MON4D3/LuaSnip",
    
    -- Dependencies for LuaSnip completion and pre-made snippet collections
    dependencies = {
      "saadparwaiz1/cmp_luasnip",     -- Allows LuaSnip snippets to be used with nvim-cmp
      "rafamadriz/friendly-snippets", -- A collection of ready-to-use snippets for various languages
    },
  },
  {
    -- nvim-cmp: the completion plugin for Neovim
    "hrsh7th/nvim-cmp",

    config = function()
      local cmp = require("cmp")

      -- Load snippets from friendly-snippets in VSCode format
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          -- Tell nvim-cmp how to expand snippets using LuaSnip
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          -- Use bordered windows for completion and documentation popups
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- Scroll docs up
          ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- Scroll docs down
          ["<C-Space>"] = cmp.mapping.complete(),     -- Trigger completion menu
          ["<C-e>"] = cmp.mapping.abort(),            -- Close completion menu
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },   -- Use LSP completion source
          { name = "luasnip" },    -- Use LuaSnip snippets source
        }, {
          { name = "buffer" },     -- Use current buffer words as a fallback source
        }),
      })
    end,
  },
}

--[[
What is this completions setup?

This configuration sets up the Neovim completion ecosystem using:

- nvim-cmp: a fast and flexible completion plugin
- cmp-nvim-lsp: integrates LSP completions into nvim-cmp
- LuaSnip: a snippet engine that allows you to expand pre-defined or custom code snippets
- cmp_luasnip: connects LuaSnip with nvim-cmp for snippet completions
- friendly-snippets: a large collection of ready-to-use snippets in VSCode format

It binds useful keymaps for navigating completion docs, triggering completion, and confirming selections, creating a smooth and powerful autocompletion experience while coding.
]]

