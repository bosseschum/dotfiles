-- Dracula Plus Colorscheme for Neovim
-- Save as ~/.config/nvim/lua/colorscheme.lua
-- Then require('colorscheme') in your init.lua

local M = {}

-- Dracula Plus color palette
local colors = {
  bg = "#212121",
  fg = "#f8f8f2",
  selection = "#44475a",
  comment = "#6272a4",
  red = "#ff5555",
  orange = "#ffb86c",
  yellow = "#f1fa8c",
  green = "#50fa7b",
  purple = "#bd93f9",
  cyan = "#8be9fd",
  pink = "#ff79c6",
  bright_red = "#ff6e6e",
  bright_green = "#69ff94",
  bright_yellow = "#ffffa5",
  bright_blue = "#d6acff",
  bright_magenta = "#ff92df",
  bright_cyan = "#a4ffff",
  bright_white = "#ffffff",
  menu = "#212121",
  visual = "#3e4452",
  gutter_fg = "#4b5263",
  nontext = "#3b4048",
  black = "#21222c",
}

function M.setup()
  -- Reset colors
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "dracula-plus"

  local function hi(group, opts)
    local cmd = "highlight " .. group
    if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
    if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
    if opts.gui then cmd = cmd .. " gui=" .. opts.gui end
    if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
    vim.cmd(cmd)
  end

  -- Editor highlights
  hi("Normal", { fg = colors.fg, bg = colors.bg })
  hi("NormalFloat", { fg = colors.fg, bg = colors.menu })
  hi("ColorColumn", { bg = colors.selection })
  hi("Cursor", { fg = colors.bg, bg = colors.fg })
  hi("CursorLine", { bg = colors.selection })
  hi("CursorLineNr", { fg = colors.fg, gui = "bold" })
  hi("LineNr", { fg = colors.comment })
  hi("SignColumn", { bg = colors.bg })
  hi("VertSplit", { fg = colors.selection })
  hi("Visual", { bg = colors.selection })
  hi("VisualNOS", { bg = colors.selection })
  hi("Search", { fg = colors.bg, bg = colors.orange })
  hi("IncSearch", { fg = colors.bg, bg = colors.orange })
  hi("Pmenu", { fg = colors.fg, bg = colors.menu })
  hi("PmenuSel", { fg = colors.bg, bg = colors.purple })
  hi("PmenuSbar", { bg = colors.selection })
  hi("PmenuThumb", { bg = colors.fg })
  hi("StatusLine", { fg = colors.fg, bg = colors.menu })
  hi("StatusLineNC", { fg = colors.comment, bg = colors.menu })
  hi("TabLine", { fg = colors.comment, bg = colors.menu })
  hi("TabLineFill", { bg = colors.menu })
  hi("TabLineSel", { fg = colors.fg, bg = colors.bg })
  hi("MatchParen", { fg = colors.green, gui = "bold" })
  hi("Folded", { fg = colors.comment, bg = colors.selection })
  hi("FoldColumn", { fg = colors.comment, bg = colors.bg })

  -- Syntax highlighting
  hi("Comment", { fg = colors.comment, gui = "italic" })
  hi("Constant", { fg = colors.purple })
  hi("String", { fg = colors.yellow })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.purple })
  hi("Boolean", { fg = colors.purple })
  hi("Float", { fg = colors.purple })
  hi("Identifier", { fg = colors.fg })
  hi("Function", { fg = colors.green })
  hi("Statement", { fg = colors.pink })
  hi("Conditional", { fg = colors.pink })
  hi("Repeat", { fg = colors.pink })
  hi("Label", { fg = colors.pink })
  hi("Operator", { fg = colors.pink })
  hi("Keyword", { fg = colors.pink })
  hi("Exception", { fg = colors.pink })
  hi("PreProc", { fg = colors.pink })
  hi("Include", { fg = colors.pink })
  hi("Define", { fg = colors.pink })
  hi("Macro", { fg = colors.pink })
  hi("PreCondit", { fg = colors.pink })
  hi("Type", { fg = colors.cyan, gui = "italic" })
  hi("StorageClass", { fg = colors.pink })
  hi("Structure", { fg = colors.cyan })
  hi("Typedef", { fg = colors.cyan })
  hi("Special", { fg = colors.pink })
  hi("SpecialChar", { fg = colors.pink })
  hi("Tag", { fg = colors.pink })
  hi("Delimiter", { fg = colors.fg })
  hi("SpecialComment", { fg = colors.comment, gui = "italic" })
  hi("Debug", { fg = colors.red })
  hi("Underlined", { fg = colors.cyan, gui = "underline" })
  hi("Ignore", { fg = colors.comment })
  hi("Error", { fg = colors.red, gui = "bold" })
  hi("Todo", { fg = colors.purple, gui = "bold,italic" })

  -- Diagnostics
  hi("DiagnosticError", { fg = colors.red })
  hi("DiagnosticWarn", { fg = colors.yellow })
  hi("DiagnosticInfo", { fg = colors.cyan })
  hi("DiagnosticHint", { fg = colors.purple })
  hi("DiagnosticUnderlineError", { sp = colors.red, gui = "underline" })
  hi("DiagnosticUnderlineWarn", { sp = colors.yellow, gui = "underline" })
  hi("DiagnosticUnderlineInfo", { sp = colors.cyan, gui = "underline" })
  hi("DiagnosticUnderlineHint", { sp = colors.purple, gui = "underline" })

  -- LSP
  hi("LspReferenceText", { bg = colors.selection })
  hi("LspReferenceRead", { bg = colors.selection })
  hi("LspReferenceWrite", { bg = colors.selection })

  -- Git signs
  hi("GitSignsAdd", { fg = colors.green })
  hi("GitSignsChange", { fg = colors.yellow })
  hi("GitSignsDelete", { fg = colors.red })
  hi("DiffAdd", { fg = colors.green, bg = colors.bg })
  hi("DiffChange", { fg = colors.yellow, bg = colors.bg })
  hi("DiffDelete", { fg = colors.red, bg = colors.bg })
  hi("DiffText", { fg = colors.cyan, bg = colors.selection })

  -- Treesitter
  hi("@variable", { fg = colors.fg })
  hi("@variable.builtin", { fg = colors.purple, gui = "italic" })
  hi("@variable.parameter", { fg = colors.orange })
  hi("@variable.member", { fg = colors.fg })
  hi("@constant", { fg = colors.purple })
  hi("@constant.builtin", { fg = colors.purple, gui = "italic" })
  hi("@constant.macro", { fg = colors.purple })
  hi("@string", { fg = colors.yellow })
  hi("@string.escape", { fg = colors.pink })
  hi("@string.special", { fg = colors.pink })
  hi("@character", { fg = colors.green })
  hi("@number", { fg = colors.purple })
  hi("@boolean", { fg = colors.purple })
  hi("@float", { fg = colors.purple })
  hi("@function", { fg = colors.green })
  hi("@function.builtin", { fg = colors.cyan })
  hi("@function.macro", { fg = colors.green })
  hi("@function.method", { fg = colors.green })
  hi("@constructor", { fg = colors.cyan })
  hi("@keyword", { fg = colors.pink })
  hi("@keyword.function", { fg = colors.cyan, gui = "italic" })
  hi("@keyword.operator", { fg = colors.pink })
  hi("@keyword.return", { fg = colors.pink })
  hi("@conditional", { fg = colors.pink })
  hi("@repeat", { fg = colors.pink })
  hi("@label", { fg = colors.pink })
  hi("@operator", { fg = colors.pink })
  hi("@exception", { fg = colors.pink })
  hi("@type", { fg = colors.cyan, gui = "italic" })
  hi("@type.builtin", { fg = colors.cyan, gui = "italic" })
  hi("@type.qualifier", { fg = colors.pink })
  hi("@property", { fg = colors.fg })
  hi("@attribute", { fg = colors.green })
  hi("@field", { fg = colors.fg })
  hi("@parameter", { fg = colors.orange })
  hi("@namespace", { fg = colors.fg })
  hi("@tag", { fg = colors.pink })
  hi("@tag.attribute", { fg = colors.green })
  hi("@tag.delimiter", { fg = colors.fg })
  hi("@punctuation.delimiter", { fg = colors.fg })
  hi("@punctuation.bracket", { fg = colors.fg })
  hi("@punctuation.special", { fg = colors.pink })
  hi("@comment", { fg = colors.comment, gui = "italic" })

  -- Telescope
  hi("TelescopeNormal", { fg = colors.fg, bg = colors.menu })
  hi("TelescopeBorder", { fg = colors.selection, bg = colors.menu })
  hi("TelescopePromptNormal", { bg = colors.menu })
  hi("TelescopePromptBorder", { fg = colors.selection, bg = colors.menu })
  hi("TelescopePromptTitle", { fg = colors.pink, bg = colors.menu })
  hi("TelescopePreviewTitle", { fg = colors.green, bg = colors.menu })
  hi("TelescopeResultsTitle", { fg = colors.cyan, bg = colors.menu })
  hi("TelescopeSelection", { fg = colors.fg, bg = colors.selection })
  hi("TelescopeSelectionCaret", { fg = colors.pink })
  hi("TelescopeMatching", { fg = colors.purple, gui = "bold" })

  -- NvimTree
  hi("NvimTreeNormal", { fg = colors.fg, bg = colors.menu })
  hi("NvimTreeFolderIcon", { fg = colors.purple })
  hi("NvimTreeFolderName", { fg = colors.cyan })
  hi("NvimTreeOpenedFolderName", { fg = colors.cyan, gui = "bold" })
  hi("NvimTreeRootFolder", { fg = colors.purple, gui = "bold" })
  hi("NvimTreeGitDirty", { fg = colors.yellow })
  hi("NvimTreeGitNew", { fg = colors.green })
  hi("NvimTreeGitDeleted", { fg = colors.red })
  hi("NvimTreeSpecialFile", { fg = colors.pink })
  hi("NvimTreeIndentMarker", { fg = colors.comment })

  -- WhichKey
  hi("WhichKey", { fg = colors.purple })
  hi("WhichKeyGroup", { fg = colors.cyan })
  hi("WhichKeyDesc", { fg = colors.fg })
  hi("WhichKeySeperator", { fg = colors.comment })
  hi("WhichKeyFloat", { bg = colors.menu })
  hi("WhichKeyBorder", { fg = colors.selection })
end

M.setup()

return M
