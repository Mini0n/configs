
return {
  "joeveiga/ng.nvim",
  
  opts = { noremap = true, silent = true },
  lazy = false,

  config = function()
    local ng = require("ng")
    -- ng.setup()

    -- launch keymap
    vim.keymap.set("n", "<localleader>at", ng.goto_template_for_component, opts)
    vim.keymap.set("n", "<localleader>ac", ng.goto_component_with_template_file, opts)
    vim.keymap.set("n", "<localleader>aT", ng.get_template_tcb, opts)
  end,
}
