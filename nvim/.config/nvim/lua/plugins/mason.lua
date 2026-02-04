return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "mason.nvim",
    opts = {
      ensure_installed = {
        "html",
        "cssls",
        "ts_ls",
        "emmet_language_server",
      },
    },
  },
}

