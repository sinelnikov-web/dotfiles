return {
	"stevearc/conform.nvim",
	optional = true,
	opts = function(_, opts)
		opts.formatters_by_ft["c"] = { "clang_format" }
		opts.formatters_by_ft["svelte"] = { "stylelint" }
		opts.formatters_by_ft["zsh"] = { "shfmt" }

		opts.formatters_by_ft["markdown"] = {}

		vim.list_extend(opts.formatters_by_ft["css"], { "stylelint" })
		opts.formatters_by_ft["typescript"] = { "eslint-lsp" }
		opts.formatters_by_ft["typescriptreact"] = { "eslint-lsp" }
		opts.formatters_by_ft["javascript"] = { "eslint-lsp" }
		opts.formatters_by_ft["javascriptreact"] = { "eslint-lsp" }
	end,
}
