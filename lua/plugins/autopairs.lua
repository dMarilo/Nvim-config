return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {}, -- uses default config
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- Optional: integrate with nvim-cmp
    local cmp_status, cmp = pcall(require, "cmp")
    if cmp_status then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}

