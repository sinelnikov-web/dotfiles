return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							rope_autoimport = {
								enabled = true
							},
							pyflakes = {
								enabled = false
							}
						}
					},
				}
			},
			pyright = {
				enabled = vim.g.lazyvim_python_lsp ~= "basedpyright",
			},
			basedpyright = {
				mason = false,
				enabled = false,
				settings = {
					enabled = false
				}
			},
			ruff_lsp = {
				mason = false,
				enabled = false,
				settings = {
					enabled = false
				}
			}
			-- ruff_lsp = {
			-- 	keys = {
			-- 		{
			-- 			"<leader>co",
			-- 			function()
			-- 				vim.lsp.buf.code_action({
			-- 					apply = true,
			-- 					context = {
			-- 						only = { "source.organizeImports" },
			-- 						diagnostics = {},
			-- 					},
			-- 				})
			-- 			end,
			-- 			desc = "Organize Imports",
			-- 		},
			-- 	},
			-- },
		},
	},
}
