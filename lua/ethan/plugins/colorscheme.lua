return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			transparent_background = true,
			show_end_of_buffer = true,
			term_colors = true,
			integrations = {
				cmp = true,
				treesitter = true,
				harpoon = true,
				indent_blankline = {
					enabled = true,
					scope_color = "text",
					colored_indent_levels = false,
				},
				mason = true,
				mini = {
					enabled = true,
					indendscope_color = "text",
				},
				noice = true,
				dap = true,
				dap_ui = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				notify = true,
				telescope = true,
				which_key = true,
				lsp_trouble = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
