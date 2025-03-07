return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"rshkarin/mason-nvim-lint",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("mason-nvim-lint").setup()

		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "luacheck" },
			python = { "ruff", "mypy" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
