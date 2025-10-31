return {
	"telescope.nvim",
	branch = "0.1.x",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- 	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 	"nvim-tree/nvim-web-devicons",
	-- },
	after = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local telescope_builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		-- TODO: fix telescope-fzf-native on nixos before re-enabling this.
		-- telescope.load_extension("fzf")
		-- Enable telescope extensions, if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", function()
			telescope_builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } }) -- use ripgrep (rg), show hidden except .git
		end, { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[F]ind [H]elp" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffer" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume last find" })
	end,
}
