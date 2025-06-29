
-- A lot of configurations copied from:
-- https://github.com/monsterlessonsacademy/monsterlessonsacademy/blob/448-vim-setup/lua/ejiqpep/plugins/nvim-autopairs.lua

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true,    -- enable treesitter
        ts_config = {
          lua = { "string" },  -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in js template_string treesitter nodes
        }
      })

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completitions plugin)
      local cmp = require("cmp")

      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
