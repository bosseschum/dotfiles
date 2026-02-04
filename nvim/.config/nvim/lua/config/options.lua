local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation (frontend-friendly)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Wrapping
opt.wrap = false

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- UI / UX
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 400

-- Clipboard
opt.clipboard = "unnamedplus"

-- Undo
opt.undofile = true

-- Disable some default junk
opt.swapfile = false
opt.backup = false
opt.writebackup = false

