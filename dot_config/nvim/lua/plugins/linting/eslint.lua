return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		lazy = false,
		opts = {
			servers = {
				eslint = {
					command = "eslint_d",
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = bufnr,
							command = "EslintFixAll",
						})
					end,
				},
			},
			setup = {
				eslint = function(_, opts)
					local lspconfig = require("lspconfig")
					local cmp_nvim_lsp = require("cmp_nvim_lsp")
					local capabilities = cmp_nvim_lsp.default_capabilities()

					opts.capabilities = capabilities
					lspconfig.eslint.setup(opts)
				end,
			},
		},
	},
}
