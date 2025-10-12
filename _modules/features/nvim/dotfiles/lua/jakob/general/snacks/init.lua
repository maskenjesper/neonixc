return {
	"snacks.nvim",

	after = function()
		-- configure lualine with modified theme
		require("snacks").setup({
			opts = {
				scroll = { enabled = true },
			},
		})
	end,
}
