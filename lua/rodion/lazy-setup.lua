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

require("lazy").setup({
	"nvim-lua/plenary.nvim",
	-- themes
	"rose-pine/neovim",
	"bluz71/vim-nightfly-guicolors",
	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",
	-- maximizes and restores current window
	"szw/vim-maximizer",
	-- essential plugins: add, delete, change surroundings (it's awesome)
	"tpope/vim-surround",
	-- commenting with gc
	"numToStr/Comment.nvim",
	-- file explorer
	"nvim-tree/nvim-tree.lua",
	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",
	-- statusline
	"nvim-lualine/lualine.nvim",
	-- fuzzy finding w/ telescope: dependency for better sorting performance
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- fuzzy finder
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	-- autocompletion: completion plugin
	"hrsh7th/nvim-cmp",
	-- source for text in buffer
	"hrsh7th/cmp-buffer",
	-- source for file system paths
	"hrsh7th/cmp-path",
	-- for autocompletion to work
	"L3MON4D3/LuaSnip",
	-- managing & installing lsp servers, linters & formatters: in charge of managing lsp servers, linters & formatters
	"williamboman/mason.nvim",
	-- bridges gap b/w mason & lspconfig
	"williamboman/mason-lspconfig.nvim",
	-- configuring lsp servers: easily configure language servers
	"neovim/nvim-lspconfig",
	-- for autocompletion
	"hrsh7th/cmp-nvim-lsp",
	-- enhanced lsp uis
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	-- additional functionality for typescript server (e.g. rename file & update imports)
	"jose-elias-alvarez/typescript.nvim",
	-- vs-code like icons for autocompletion
	"onsails/lspkind.nvim",
	-- formatting & linting: configure formatters & linters
	"jose-elias-alvarez/null-ls.nvim",
	-- bridges gap b/w mason & null-ls
	"jayp0521/mason-null-ls.nvim",
	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			-- autoclose tags
			"windwp/nvim-ts-autotag",
		},
	},
	"nvim-treesitter/nvim-treesitter-context",
	-- undo tree
	"mbbill/undotree",
	-- auto closing: autoclose parens, brackets, quotes, etc...
	"windwp/nvim-autopairs",
	-- git integration: show line modifications on left hand side
	"lewis6991/gitsigns.nvim",
	-- git integration
	"tpope/vim-fugitive",
	-- transparent background
	"xiyaowong/transparent.nvim",
	-- moving to search pattern
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	},
	-- highlight all uses of word under cursor
	{
		"RRethy/vim-illuminate",
		config = function()
			vim.g.Illuminate_delay = 0
		end,
	},
	-- noice ui
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- harpoon
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
		},
	},
	-- colorizer
	"NvChad/nvim-colorizer.lua",
	-- startup screen
	{
		"startup-nvim/startup.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup()
		end,
	},
	-- indent lines
	"lukas-reineke/indent-blankline.nvim",
})
