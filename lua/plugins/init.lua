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
  	autocmd BufWritePost ~/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
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

	-- Themes
	-- Onedark
	use({
		"navarasu/onedark.nvim",
		requires = "nvim-lualine/lualine.nvim",
		config = "require('themes/onedark-config')",
	})

	-- Nvim tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		cmd = "NvimTreeToggle",
		config = "require('nvim-tree-config')",
	})

	-- Toggle term
	use({ "akinsho/toggleterm.nvim", config = "require('toggleterm-config')" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		cmd = "Telescope",
		config = "require('telescope-config')",
	})

	-- Whichkey
	use({ "folke/which-key.nvim", event = "BufWinEnter", config = "require('whichkey-config')" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufWinEnter",
		config = "require('treesitter-config')",
	})

	-- Bufferline
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufWinEnter",
		config = "require('bufferline-config')",
	})

	-- Autotag
	use({ "windwp/nvim-ts-autotag", event = "InsertEnter", after = "nvim-treesitter" })

	-- Rainbow
	use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })

	-- Autopairs
	use({ "windwp/nvim-autopairs", config = "require('autopairs-config')", after = "nvim-cmp" })

	-- Colorizer
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer-config')", event = "BufRead" })

	-- Gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({ current_line_blame = true })
		end,
	})

	-- Indent blankline
	use({ "lukas-reineke/indent-blankline.nvim", config = "require('blankline-config')", event = "BufRead" })

	-- Zen mode
	use({ "folke/zen-mode.nvim", config = 'require("zen-mode-config")' })

	-- Twilight
	use({ "folke/twilight.nvim", config = "require('twilight-config')" })

	-- LSP & Completion & Snippet & Debug
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"onsails/lspkind-nvim",
			"williamboman/nvim-lsp-installer",

			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",

			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",

			"tami5/lspsaga.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = {
			"require('lsp')",
			"require('lspsaga-config')",
			"require('null-ls-config')",
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
