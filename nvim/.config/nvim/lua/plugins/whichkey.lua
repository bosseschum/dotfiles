return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      preset = "modern",
      delay = 200,

      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },

      win = {
        border = "rounded",
      },

      layout = {
        spacing = 6,
        align = "left",
      },
    })
  end,
}

