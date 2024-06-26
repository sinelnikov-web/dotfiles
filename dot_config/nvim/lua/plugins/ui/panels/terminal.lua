return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = [[<c-\>]],
		},

		keys = {
			{
				"<m-esc>",
				function()
					require("toggleterm").toggle(1, nil, vim.loop.cwd(), "horizontal")
				end,
				mode = { "n", "v", "t" },
				desc = "Toggle terminal",
			},
		},
	},
}
