return {
	"hrsh7th/cmp-nvim-lsp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("gopls", {
			capabilities = capabilities,
		})
		vim.lsp.enable("gopls")

		vim.lsp.config("denols", {
			capabilities = capabilities,
			settings = {
				deno = {
					enable = true,
					lint = true,
					unstable = true,
				},
			},
		})
		vim.lsp.enable("denols")

		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			single_file_support = false,
			settings = {
				typescript = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						quotePreference = "double",
					},
				},
				javascript = {
					preferences = {
						importModuleSpecifierPreference = "relative",
						quotePreference = "double",
					},
				},
			},
		})
		vim.lsp.enable("ts_ls")
	end,
}
