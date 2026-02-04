return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "tsx",
        "json",
        "lua",
        "ruby",
      },
      highlight = { enable = true },
      autotag = { enable = true },
    })
  end,
}
