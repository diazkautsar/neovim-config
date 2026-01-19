return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		-- configure treesitter
		treesitter.setup({
			modules = {},
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"go",
				"gomod",
				"gowork",
				"gosum",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})

		-- use bash parser for zsh files
		vim.treesitter.language.register("bash", "zsh")
	end,
}
