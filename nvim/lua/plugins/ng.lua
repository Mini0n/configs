return {
  {
    "joeveiga/ng.nvim",
    config = function()
      local ng = require("ng")
      local opts = { noremap = true, silent = true }  -- Keymap options: non-recursive, silent

      -- Custom function to go to stylesheet from component or template
      local function goto_stylesheet_for_component(reuse_window)  -- Function definition with reuse_window parameter
        local current_file = vim.api.nvim_buf_get_name(0)         -- Get current buffer's file path (0 = current buffer)
        if not current_file then return end                       -- Exit if no file is open

        -- Extract component name (works for both .ts and .html files)
        local component_name = current_file:gsub('%.component%.[^.]+$', '')  -- Remove '.component.*' extension to get base name

        -- Try different stylesheet extensions
        local stylesheets = {                   -- Array of possible stylesheet file names
          component_name .. '.component.scss',  -- SCSS stylesheet
          component_name .. '.component.css',   -- CSS stylesheet
        }

        for _, stylesheet in ipairs(stylesheets) do     -- Loop through possible stylesheet files
          if vim.fn.filereadable(stylesheet) == 1 then  -- Check if file exists and is readable
            if reuse_window then                        -- If reuse_window is true, try to find existing window
              -- Try to find existing window with this file
              for _, win in ipairs(vim.api.nvim_list_wins()) do   -- Loop through all windows
                local buf = vim.api.nvim_win_get_buf(win)         -- Get buffer ID for this window
                local buf_name = vim.api.nvim_buf_get_name(buf)   -- Get buffer's file name
                if buf_name == stylesheet then                    -- If this window has our target file
                  vim.api.nvim_set_current_win(win)               -- Switch to that window
                  return  -- Exit function
                end
              end
            end
            vim.cmd('edit ' .. vim.fn.fnameescape(stylesheet))  -- Open file in new window (escaped for safety)
            return
          end
        end

        vim.notify('Stylesheet not found for current file', vim.log.levels.WARN)
      end

      -- Custom function to go to template from any file type
      local function goto_template_universal(reuse_window)  -- Universal template navigation function
        local current_file = vim.api.nvim_buf_get_name(0)   -- Get current file path
        if not current_file then return end                 -- Exit if no file open

        -- Check what type of file we're in
        if current_file:match('%.component%.ts$') then  -- If we're in a TypeScript component file
          -- In component file, use ng.nvim function
          if reuse_window then                                       -- If reuse_window requested
            ng.goto_template_for_component({ reuse_window = true })  -- Use ng.nvim with reuse option
          else
            ng.goto_template_for_component()  -- Use ng.nvim default behavior
          end
        elseif current_file:match('%.component%.html$') then  -- If we're already in template file
          -- Already in template file, nothing to do
          vim.notify('Already in template file', vim.log.levels.INFO)
          return  -- Exit function
        elseif current_file:match('%.component%.[sc]ss$') then  -- If we're in a stylesheet file
          -- In stylesheet file, go to template directly
          local template_file = current_file:gsub('%.component%.[sc]ss$', '.component.html')  -- Replace extension
          if vim.fn.filereadable(template_file) == 1 then                                     -- Check if template file exists
            if reuse_window then                                                              -- If reuse_window requested
              -- Try to find existing window with this file
              for _, win in ipairs(vim.api.nvim_list_wins()) do  -- Loop through all windows
                local buf = vim.api.nvim_win_get_buf(win)        -- Get buffer for window
                local buf_name = vim.api.nvim_buf_get_name(buf)  -- Get buffer file name
                if buf_name == template_file then                -- If window has our target file
                  vim.api.nvim_set_current_win(win)              -- Switch to that window
                  return
                end
              end
            end
            vim.cmd('edit ' .. vim.fn.fnameescape(template_file))  -- Open template file
          else
            vim.notify('Template file not found: ' .. template_file, vim.log.levels.WARN)
          end
        else
          vim.notify('Not in an Angular component file', vim.log.levels.WARN)
        end
      end

      -- Custom function to go to component from any file type
      local function goto_component_universal(reuse_window)  -- Universal component navigation function
        local current_file = vim.api.nvim_buf_get_name(0)    -- Get current file path
        if not current_file then return end                  -- Exit if no file open

        -- Check what type of file we're in
        if current_file:match('%.component%.ts$') then  -- If already in component file
          -- Already in component file, nothing to do
          vim.notify('Already in component file', vim.log.levels.INFO)  -- Inform user
          return
        elseif current_file:match('%.component%.html$') then  -- If in template file
          -- In template file, use ng.nvim function
          if reuse_window then  -- If reuse_window requested
            ng.goto_component_with_template_file({ reuse_window = true })  -- Use ng.nvim with reuse
          else
            ng.goto_component_with_template_file()  -- Use ng.nvim default
          end
        elseif current_file:match('%.component%.[sc]ss$') then  -- If in stylesheet file
          -- In stylesheet file, go to component directly
          local component_file = current_file:gsub('%.component%.[sc]ss$', '.component.ts')  -- Replace extension
          if vim.fn.filereadable(component_file) == 1 then  -- Check if component file exists
            if reuse_window then  -- If reuse_window requested
              -- Try to find existing window with this file
              for _, win in ipairs(vim.api.nvim_list_wins()) do  -- Loop through all windows
                local buf = vim.api.nvim_win_get_buf(win)        -- Get buffer for window
                local buf_name = vim.api.nvim_buf_get_name(buf)  -- Get buffer file name
                if buf_name == component_file then               -- If window has our target file
                  vim.api.nvim_set_current_win(win)              -- Switch to that window
                  return  -- Exit function
                end
              end
            end
            vim.cmd('edit ' .. vim.fn.fnameescape(component_file))  -- Open component file
          else
            vim.notify('Component file not found: ' .. component_file, vim.log.levels.WARN)  -- Warning if not found
          end
        else
          vim.notify('Not in an Angular component file', vim.log.levels.WARN)  -- Not in component-related file
        end
      end

      -- Angular navigation keymaps
      vim.keymap.set("n", "<leader>at", function() goto_template_universal(false) end, opts)
      vim.keymap.set("n", "<leader>ac", function() goto_component_universal(false) end, opts)
      vim.keymap.set("n", "<leader>as", function() goto_stylesheet_for_component(false) end, opts)
      vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)

      -- Alternative versions that reuse existing windows
      vim.keymap.set("n", "<leader>aR", function() goto_template_universal(true) end, opts)
      vim.keymap.set("n", "<leader>aC", function() goto_component_universal(true) end, opts)
      vim.keymap.set("n", "<leader>aS", function() goto_stylesheet_for_component(true) end, opts)
    end,
  },
}
