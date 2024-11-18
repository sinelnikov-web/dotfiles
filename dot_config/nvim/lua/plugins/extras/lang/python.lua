return {
	"neovim/nvim-lspconfig",
	opts = function()
		vim.g.lazyvim_python_lsp = "basedpyright"
	end,
}
