local highlights = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local colors = {
  "#f38ba8", -- red
  "#f9e2af", -- yellow
  "#89b4fa", -- blue
  "#fab387", -- orange
  "#a6e3a1", -- green
  "#cba6f7", -- violet
  "#94e2d5", -- cyan
}

for i, group in ipairs(highlights) do
  vim.api.nvim_set_hl(0, group, { fg = colors[i] })
end

