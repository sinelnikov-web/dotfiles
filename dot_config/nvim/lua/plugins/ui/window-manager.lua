local filter_relative_empty = function(_, win)
	return vim.api.nvim_win_get_config(win).relative == ""
end

return {
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		optional = true,

		dependencies = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function()
					local Offset = require("bufferline.offset")
					if not Offset.edgy then
						local get = Offset.get
						Offset.get = function()
							if package.loaded.edgy then
								local layout = require("edgy.config").layout
								local ret = {
									left = "%#EdgyTitle#%*",
									left_size = 0,
									right = "",
									right_size = 0,
								}
								local sb = layout["left"]
								if sb and #sb.wins > 0 then
									ret["left"] = "%#EdgyTitle#" .. string.rep(" ", sb.bounds.width) .. "%*"
									ret["left_size"] = sb.bounds.width
								end
								ret.total_size = ret.left_size + ret.right_size
								if ret.total_size > 0 then
									return ret
								end
							end
							return get()
						end
						Offset.edgy = true
					end
				end,
			},
		},

		keys = {
			{ "<leader>uh", [[<cmd>lua require("edgy").close()<cr>]], desc = "Edgy close windows" },
			{ "<C-M-k>",    "<cmd>resize +3<cr>",                     mode = { "n", "v", "t" },   desc = "Increase window height" },
			{ "<C-M-j>",    "<cmd>resize -3<cr>",                     mode = { "n", "v", "t" },   desc = "Decrease window height" },
			{ "<C-M-h>",    "<cmd>vertical resize -3<cr>",            mode = { "n", "v", "t" },   desc = "Decrease window width" },
			{ "<C-M-l>",    "<cmd>vertical resize +3<cr>",            mode = { "n", "v", "t" },   desc = "Increase window width" },
		},

		opts = {
			animate = { enabled = false },
			wo = {
				winbar = false,
				winfixwidth = false,
			},

			options = {
				left = { size = 10 },
				bottom = { size = 5 },
				right = { size = 40 },
			},

			left = {
				{ ft = "neo-tree", size = { width = 40 } },
			},

			right = {
				{ ft = "spectre_panel",   size = { height = 0.8, width = 80 } },
				{ ft = "neotest-summary", size = { width = 40 } },
				{ ft = "aerial" },
				-- { ft = "dapui_scopes" },
				-- { ft = "dapui_watches" },
				-- { ft = "dapui_stacks" },
				-- { ft = "dapui_breakpoints", size = { height = 10 } },
			},

			bottom = {
				{ ft = "toggleterm", filter = filter_relative_empty, size = { height = 10 } },
				{ ft = "Trouble" },
				{ ft = "noice",      filter = filter_relative_empty },
				-- { ft = "dap-repl" },
				-- { ft = "dapui_console" },
			},

			keys = {
				-- stylua: ignore start
				["<C-M-l>"] = function(win) win:resize("width", 3) end,
				["<C-M-h>"] = function(win) win:resize("width", -3) end,
				["<C-M-k>"] = function(win) win:resize("height", 3) end,
				["<C-M-j>"] = function(win) win:resize("height", -3) end,
				-- stylua: ignore end
			},
		},
	},
}
