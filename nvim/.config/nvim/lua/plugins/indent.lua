return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      -- Let indent-rainbowline generate the rainbow config
      return require("indent-rainbowline").make_opts({
        indent = {
          char = "│",
        },
        scope = {
          enabled = false, -- disable scope highlight (optional)
        },
        exclude = {
          filetypes = {
            "help",
            "dashboard",
            "lazy",
            "mason",
            "neo-tree",
            "Trouble",
          },
        },
      })
    end,
  },
}

