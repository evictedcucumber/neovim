return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = { width = 0.9 },
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set(
			"n",
			"<leader>ff",
			"<cmd> Telescope find_files <CR>",
			{ desc = "Find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fr",
			"<cmd> telescope oldfiles <CR>",
			{ desc = "Find recent files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fss",
			"<cmd> Telescope live_grep<CR>",
			{ desc = "Find string by search" }
		)
		vim.keymap.set(
			"n",
			"<leader>fsc",
			"<cmd> Telescope grep_string <CR>",
			{ desc = "Find string under cursor" }
		)
		vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help" })
	end,
}
