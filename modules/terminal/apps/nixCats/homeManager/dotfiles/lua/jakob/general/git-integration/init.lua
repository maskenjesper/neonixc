return {
	{
		"vim-fugitive",
	},
	{
		"gitsigns.nvim",
		after = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Git - Preview hunk" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Git - Toggle line blame" }
			)
			vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "Git - View blame" })
		end,
	},
}
