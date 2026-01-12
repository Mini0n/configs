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
      defaults = {
        -- File patterns to ignore in all pickers
        file_ignore_patterns = {
          "node_modules",    -- Node.js dependencies
          ".git/",           -- Git repository files
          ".cache",          -- Cache directories
          "%.o",             -- Compiled object files
          "%.a",             -- Static library files
          "%.out",           -- Executable files
          "%.class",         -- Java class files
          "%.pdf",           -- PDF files
          "%.mkv",           -- Video files
          "%.mp4",           -- Video files
          "%.zip",           -- Archive files
          "dist/",           -- Build output directories
          "build/",          -- Build directories
          ".next/",          -- Next.js build files
          ".nuxt/",          -- Nuxt.js build files
          ".vuepress/",      -- VuePress build files
          ".cache/",         -- Various cache directories
          ".pytest_cache/",  -- Python pytest cache
          "__pycache__/",    -- Python bytecode cache
          ".DS_Store",       -- macOS system files
          "target/",         -- Rust/Cargo build directory
          ".cargo/",         -- Rust Cargo directory
          ".rustup/",        -- Rust toolchain directory
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          -- Additional find_files specific options can go here
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
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
