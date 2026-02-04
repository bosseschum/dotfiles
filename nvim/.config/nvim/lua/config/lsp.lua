-- HTML
vim.lsp.config("html", {})

-- CSS
vim.lsp.config("cssls", {})

-- JavaScript / TypeScript
vim.lsp.config("ts_ls", {})

-- Ruby
vim.lsp.config("ruby_lsp", {})

-- Emmet
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
})
