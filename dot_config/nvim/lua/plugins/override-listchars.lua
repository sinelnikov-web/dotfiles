return {
	"aimuzov/LazyVimx",
	opts = function()
		vim.opt.listchars = { eol = " ", space = " ", tab = "  ", nbsp = "␣" }
		vim.api.nvim_set_hl(0, "NBSP", { fg = "#9ece6a" })
		vim.cmd("match NBSP / /")
	end,
}
