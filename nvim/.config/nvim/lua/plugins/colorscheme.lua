return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        nvimtree = true,
        bufferline = true,
        lualine = true,
        cmp = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
    require("config.indent")
  end,
}

