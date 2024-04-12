return {
	{
		"rcarriga/nvim-dap-ui",
		opts = {
			floating = { border = "rounded" },
		},
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
			{
				"microsoft/vscode-js-debug",
				version = "1.x",
				build = "npm install && npx gulp vsDebugServerBundle && mv dist out",
			},
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			-- JS / TS
			if not dap.adapters["pwa-node"] then
				require("dap").adapters["pwa-node"] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "node",
						-- 💀 Make sure to update this path to point to your installation
						args = {
							require("mason-registry").get_package("js-debug-adapter"):get_install_path()
							.. "/js-debug/src/dapDebugServer.js",
							"${port}",
						},
					},
				}
			end
			for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
				if not dap.configurations[language] then
					dap.configurations[language] = {
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
						},
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach",
							processId = require("dap.utils").pick_process,
							cwd = "${workspaceFolder}",
						},
					}
				end
			end

			-- require("dap-vscode-js").setup({
			-- 	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			-- 	adapters = {
			-- 		"pwa-node",
			-- 		"pwa-chrome",
			-- 		-- "pwa-msedge",
			-- 		-- "node-terminal",
			-- 		-- "pwa-extensionHost",
			-- 	},
			-- })

			-- for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
			-- 	require("dap").configurations[language] = {
			-- 		{
			-- 			type = "pwa-chrome",
			-- 			name = "Launch Chrome to debug client",
			-- 			request = "launch",
			-- 			url = "http://localhost:8080",
			-- 			sourceMaps = true,
			-- 			webRoot = "${workspaceFolder}",
			-- 			skipFiles = { "**/node_modules/**/*", "**/src/*" },
			-- 		},
			-- 		{
			-- 			type = "pwa-node",
			-- 			request = "attach",
			-- 			processId = require("dap.utils").pick_process,
			-- 			name = "Attach debugger to existing `node --inspect` process",
			-- 			sourceMaps = true,
			-- 			resolveSourceMapLocations = {
			-- 				"${workspaceFolder}/**",
			-- 				"!**/node_modules/**",
			-- 			},
			-- 			cwd = "${workspaceFolder}/src",
			-- 			skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
			-- 		},
			-- 		-- only if language is javascript, offer this debug action
			-- 		language == "javascript"
			-- 		and {
			-- 			type = "pwa-node",
			-- 			request = "launch",
			-- 			name = "Launch file in new node process",
			-- 			program = "${file}",
			-- 			cwd = "${workspaceFolder}",
			-- 		}
			-- 		or nil,
			-- 	}
			-- end

			local sign = vim.fn.sign_define

			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true })
			end
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
}
