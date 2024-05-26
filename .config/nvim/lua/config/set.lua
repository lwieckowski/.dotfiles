vim.cmd("set noshowcmd")

vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.g.netrw_banner = 0

vim.o.statusline = [[%t%r%m%= %2p%% %5l:%-2c]]

local statusline = {
  ' %t',
  '%r',
  '%m',
  '%=',
  ' %2p%%',
  ' %3l:%-2c '
}

-- vim.o.statusline = table.concat(statusline, '')

