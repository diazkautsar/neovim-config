vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	command = "hi Folded guibg=NONE ctermbg=NONE",
})
