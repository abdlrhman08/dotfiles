-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable 24-bit colour
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"


vim.o.tabstop = 4 
vim.o.expandtab = true
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4

require("config.lazy")
require("config.statusline")

vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
