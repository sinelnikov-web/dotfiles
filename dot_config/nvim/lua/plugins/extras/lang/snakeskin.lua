-- local snakeskin_ls = require "lspconfig.server_configurations.snakeskin_ls"
return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			snakeskin_ls = {},
		},
	},
}
