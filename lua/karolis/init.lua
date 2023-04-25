local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig', 
	'simrat39/rust-tools.nvim',
	'hrsh7th/nvim-cmp', 

	-- LSP completion source:
	'hrsh7th/cmp-nvim-lsp',

	-- Useful completion sources:
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/cmp-path', 
	'hrsh7th/cmp-buffer', 
	'hrsh7th/vim-vsnip',
	'nvim-treesitter/nvim-treesitter',

	-- Debugger
	'puremourning/vimspector',

	-- Telescope
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},


	{ 'rose-pine/neovim', name = 'rose-pine' },

})

-- Mason Setup
require("mason").setup({
	ui = {
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	}
})
require("mason-lspconfig").setup()
