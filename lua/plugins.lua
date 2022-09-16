-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Autocommand that reloads neovim whenever you save the plugins/init.lua file
vim.cmd([[
	augroup packer_user_config
  	autocmd!
  	autocmd BufWritePost ~/.config/nvim/lua/plugins.lua source <afile> | PackerSync
	augroup end

]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Which-Key for popup with possible key bindings of the command
	use({
		"folke/which-key.nvim",
		config = "require('whichkey-config')",
	})

	-- Dashboard a start screen
	use({ "glepnir/dashboard-nvim", config = "require('dashboard-config')" })

	-- Telescope a finder over lists
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Colorscheme
	use("folke/tokyonight.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = "require('tokyonight-config')",
	})

	-- Indent Blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = "require('blankline-config')",
	})

	-- Comment text
	use({ "terrortylor/nvim-comment", config = "require('comment-config')" })

	-- LSP & Completion & Snippet & Debug
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"onsails/lspkind-nvim",
			"williamboman/nvim-lsp-installer",

			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",

			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",

			"tami5/lspsaga.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = { "require('lsp-config')", "require('luasnip-config')" },
	})
	use({
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = "require('mason-config')",
	})

	-- Treesitter for highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = "require('treesitter-config')",
	})

	-- Autotag
	use({
		"windwp/nvim-ts-autotag",
	})

	-- Rainbow
	use({
		"p00f/nvim-ts-rainbow",
	})

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = "require('autopairs-config')",
	})

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		config = "require('colorizer-config')",
	})

	-- Gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = "require('nvim-tree-config')",
	})

	-- Bufferlines
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = "require('bufferlines-config')",
	})

	-- Tagbar for overview of its stucture
	use("preservim/tagbar")

	-- Toggleterm
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = "require('toggleterm-config')",
	})

	-- Lazygit
	use("kdheepak/lazygit.nvim")

	-- Emmet
	use("mattn/emmet-vim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
