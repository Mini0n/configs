-- plugins/telescope.lua

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },

    opts = {
      pickers = {
        find_files = {
          hidden = true,
          theme = "dropdown",
        }
      },
    },

    -- extensions configurations
    extensions = {
      fzf = {
        fuzzy = true,
        override_generice_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },

      ["ui-select"] = {
        -- will be set in config function
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")
      -- Ensure extensions table exists
      opts.extensions = opts.extensions or {}
      -- Set ui-select theme after telescope is loaded
      opts.extensions["ui-select"] = require("telescope.themes").get_dropdown({})
      telescope.setup(opts)

      -- keymaps
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<C-e>", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<localleader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<localleader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set('n', "<localleader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set('n', "<localleader>fc", builtin.lsp_document_symbols, { desc = "Telescope LSP document symbols" })

      require('telescope').load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  }
}
