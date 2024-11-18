return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "natecraddock/telescope-zf-native.nvim" },
	config = function(_, opts)
		opts.extensions["zf-native"] = {
			-- options for sorting file-like items
			file = {
				-- override default telescope file sorter
				enable = true,

				-- highlight matching text in results
				highlight_results = true,

				-- enable zf filename match priority
				match_filename = true,

				-- optional function to define a sort order when the query is empty
				initial_sort = nil,

				-- set to false to enable case sensitive matching
				smart_case = true,
			},
		}
		require("telescope").setup(opts)

		require("telescope").load_extension("zf-native")
	end,
}
