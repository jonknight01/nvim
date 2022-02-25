local cmd = vim.cmd
local utils = require 'config.utils'
local opt = utils.opt

vim.wo.number = true

vim.go.ignorecase = true
vim.go.syntax = "on"
vim.go.softtabstop = 4
vim.go.autoindent = true

vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

-- Colorscheme setup
vim.opt.termguicolors = true
vim.opt.background = "dark"


-- Auto install packer.nvim if not exists
local fn = vim.fn
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').startup(function() 
    use {'wbthomason/packer.nvim', opt = true}
    use {'sainnhe/gruvbox-material'} -- colours
    use {'akinsho/toggleterm.nvim'}  -- terminal
end)

cmd 'colorscheme gruvbox-material'
