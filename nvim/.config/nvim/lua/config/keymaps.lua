local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ===== General =====

map("n", "<leader>h", ":nohlsearch<CR>", {
  desc = "Clear search highlights",
  silent = true,
})

map("n", "<leader>w", ":w<CR>", {
  desc = "Save file",
  silent = true,
})

map("n", "<leader>q", ":q<CR>", {
  desc = "Quit window",
  silent = true,
})

vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", {
  desc = "Split window horizontally",
})

vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", {
  desc = "Split window vertically",
})

-- ===== Window navigation =====

vim.keymap.set("n", "<leader>bh", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>bj", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<leader>bk", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<leader>bl", "<C-w>l", { desc = "Move to right split" })

-- Resize splits
map("n", "<C-Up>", ":resize -2<CR>", {
  desc = "Decrease window height",
  silent = true,
})

map("n", "<C-Down>", ":resize +2<CR>", {
  desc = "Increase window height",
  silent = true,
})

map("n", "<C-Left>", ":vertical resize -2<CR>", {
  desc = "Decrease window width",
  silent = true,
})

map("n", "<C-Right>", ":vertical resize +2<CR>", {
  desc = "Increase window width",
  silent = true,
})

-- ===== Buffers =====

map("n", "<Tab>", ":BufferLineCycleNext<CR>", {
  desc = "Next buffer",
  silent = true,
})

map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {
  desc = "Previous buffer",
  silent = true,
})

map("n", "<leader>bd", ":bdelete<CR>", {
  desc = "Delete buffer",
  silent = true,
})

-- ===== File Tree =====

map("n", "<leader>e", ":NvimTreeToggle<CR>", {
  desc = "Toggle file explorer",
  silent = true,
})

map("n", "<leader>ef", ":NvimTreeFocus<CR>", {
  desc = "Focus file explorer",
  silent = true,
})

-- ===== LSP =====

map("n", "gd", vim.lsp.buf.definition, {
  desc = "Go to definition",
})

map("n", "gD", vim.lsp.buf.declaration, {
  desc = "Go to declaration",
})

map("n", "gr", vim.lsp.buf.references, {
  desc = "List references",
})

map("n", "gi", vim.lsp.buf.implementation, {
  desc = "Go to implementation",
})

map("n", "K", vim.lsp.buf.hover, {
  desc = "Hover documentation",
})

map("n", "<leader>rn", vim.lsp.buf.rename, {
  desc = "Rename symbol",
})

map("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code action",
})

map("n", "<leader>f", vim.lsp.buf.format, {
  desc = "Format buffer",
})

-- ===== Diagnostics =====

map("n", "[d", vim.diagnostic.goto_prev, {
  desc = "Previous diagnostic",
})

map("n", "]d", vim.diagnostic.goto_next, {
  desc = "Next diagnostic",
})

map("n", "<leader>d", vim.diagnostic.open_float, {
  desc = "Show diagnostic message",
})

-- ===== Live Server =====

map("n", "<leader>ls", ":LiveServerStart<CR>", {
  desc = "Start Live Server",
  silent = true,
})

map("n", "<leader>lx", ":LiveServerStop<CR>", {
  desc = "Stop Live Server",
  silent = true,
})

-- ===== Git =====

map("n", "]h", require("gitsigns").next_hunk, {
  desc = "Next git hunk",
})

map("n", "[h", require("gitsigns").prev_hunk, {
  desc = "Previous git hunk",
})

map("n", "<leader>gs", require("gitsigns").stage_hunk, {
  desc = "Stage hunk",
})

map("n", "<leader>gr", require("gitsigns").reset_hunk, {
  desc = "Reset hunk",
})

map("n", "<leader>gp", require("gitsigns").preview_hunk, {
  desc = "Preview hunk",
})

map("n", "<leader>gb", require("gitsigns").blame_line, {
  desc = "Blame line",
})

-- ===== Clipboard =====

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', {
  desc = "Yank to system clipboard",
})

-- Yank line to system clipboard
map("n", "<leader>Y", '"+Y', {
  desc = "Yank line to system clipboard",
})

-- Paste from system clipboard
map({ "n", "v" }, "<leader>p", '"+p', {
  desc = "Paste from system clipboard",
})

-- ===== Grouping Leaders =====

local wk = require("which-key")

wk.add({
  { "<leader>b", group = "buffers" },
  { "<leader>c", group = "code" },
  { "<leader>d", group = "diagnostics" },
  { "<leader>l", group = "live server" },
  { "<leader>r", group = "rename" },
  { "<leader>w", group = "window / write" },
})

