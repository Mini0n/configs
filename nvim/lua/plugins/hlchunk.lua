
return {
  "shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        style = {
          { fg = "#6d5d89" }, -- Normal chunk color
          { fg = "#c21f30" }, -- Error chunk color
        },
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "─",
        },
        error_sign = true,
        duration = 0, -- Animation duration in seconds
        delay = 0,    -- Delay before the animation starts
      },
      line_num = {
        enable = false,
        style = "#806d9c",
      },
      indent = {
        enable = true,
      },
    })
	end
}
