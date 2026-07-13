-- Configurate Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.timeoutlen = 10000
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.o.winborder = "rounded"
vim.o.winblend = 0
vim.o.pumblend = 0
vim.opt.shortmess:append("c")
vim.opt.cmdheight = 0
vim.opt.list = true
vim.opt.listchars:append({
  space = "·",
})
