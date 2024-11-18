return {
	"shumphrey/fugitive-gitlab.vim",
	dependencies = { "tpope/vim-fugitive" },

	init = function()
		vim.cmd("set diffopt+=vertical")
		vim.g.gitlab_api_keys = {
			["gitlab.edadeal.yandex-team.ru"] = vim.fn.getenv("GITLAB_TOKEN"),
		}
		vim.g.fugitive_gitlab_domains = {
			["git.edadeal.yandex-team.ru"] = "https://gitlab.edadeal.yandex-team.ru",
		}
	end,
}
