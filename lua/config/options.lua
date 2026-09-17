-- set leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- sets relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- sets tab width to 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- sets caseinsensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.showmode = false

-- make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
